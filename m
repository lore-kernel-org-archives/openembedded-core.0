Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.13301.1626600382130186146
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id B3B7938C139B
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 178 SUCCEEDED
Message-ID: <MADEUP.1692D86E0E0A0CEC.32641@lists.openembedded.org>
X-Groupsio-MsgNum: 153974
Content-Type: multipart/mixed; boundary="===============8546723495904830239=="

--===============8546723495904830239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *178* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-177-178.patch
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

--===============8546723495904830239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 43 skipped, 0 masked, 0 errors.
Removing 149 recipes from the core2-32 sysroot...done.
Removing 153 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8546723495904830239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "177" to "178"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 177 [default] to 178 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "177" to "178"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 177 [default] to 178 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "177" to "178"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 177 [default] to 178 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "177" to "178"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 177 [default] to 178 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "177" to "178"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 177 [default] to 178 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "177" to "178"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 177 [default] to 178 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 945397 to 976063 (+3%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "177" to "178"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 177 [default] to 178 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "177" to "178"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-177.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-178.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 177 [default] to 178 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-177-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-178-py3.9.egg-info

--===============8546723495904830239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-eff2df9e92ba1fc5bbf5c265d5bae9de66d24943"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eff2df9e92ba1fc5bbf5c265d5bae9de66d24943"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 172 Local 5 Network 0 Missed 167 Current 901 (2% match, 84% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 915 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1336 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1380 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1388 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1458 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: Running task 1493 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1506 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1527 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1585 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1586 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1605 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1644 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1645 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1646 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: Running task 1652 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1653 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1654 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1679 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1685 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1709 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1721 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: Running task 1745 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1775 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1776 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1779 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: Running task 1789 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: Running task 1790 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: Running task 1791 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1792 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: Running task 1831 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: Running task 1832 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1835 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1866 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running task 1906 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1951 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1952 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_write_config)
NOTE: Running task 1960 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe harfbuzz-2.8.2-r0: task do_fetch: Started
NOTE: Running task 1964 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1965 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: Running task 1975 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1976 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: Running task 1986 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe harfbuzz-2.8.2-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: Running task 2007 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2015 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2030 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2031 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: Running task 2032 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 2033 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: Running task 2035 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: Running task 2053 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 2068 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: Running task 2069 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 2080 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: Running task 2114 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 2127 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 2143 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: Running task 2170 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 2186 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: Running task 2190 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe harfbuzz-2.8.2-r0: task do_write_config: Started
NOTE: Running task 2191 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 2192 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2193 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2197 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: Running task 2198 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2204 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2222 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2223 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2224 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: Running task 2225 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: Running task 2245 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2256 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: Running task 2270 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2282 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 2343 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_fetch)
NOTE: Running task 2344 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_fetch)
NOTE: Running task 2345 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2346 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2414 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: Running task 2415 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2428 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2449 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 2457 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2458 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2470 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: Running task 2489 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2503 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: Running task 2504 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-178-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_fetch: Started
NOTE: Running task 2520 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2521 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-178-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 2536 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_unpack)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_fetch: Started
NOTE: Running task 2560 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: Running task 2561 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2579 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2592 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2593 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: Running task 2594 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2595 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2624 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2652 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: Running task 2653 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: Running task 2654 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2655 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-178-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2656 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2680 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_unpack: Started
NOTE: recipe diffoscope-178-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2741 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2773 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2774 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2800 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_unpack: Started
NOTE: Running task 2813 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-178-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2821 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 2835 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 2836 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: Running task 2883 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2894 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 2895 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: Running task 2912 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: Running task 2925 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2933 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2975 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2983 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: recipe diffoscope-178-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2984 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2985 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: Running task 2986 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 2987 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: Running task 2988 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.24-r0: task do_patch: Started
NOTE: Running task 2989 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2990 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2991 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: Running task 2992 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2993 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2994 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2995 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2996 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2997 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2998 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2999 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: Running task 3000 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 3001 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3002 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3003 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3004 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 3005 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3006 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 3007 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3008 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3009 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 3010 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-178-r0: task do_patch: Succeeded
NOTE: Running task 3011 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3012 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_lic)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3013 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe diffoscope-178-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3014 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: Running task 3015 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_patch: Succeeded
NOTE: Running task 3016 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2a3512e34bb8c88292f266a4cf8ceac3ca881fc19e8d9bdd9a831abf7b881d9d
NOTE: recipe python3-magic-0.4.24-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3035 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-178-r0: task do_populate_lic: Started
NOTE: Running task 3036 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_patch)
NOTE: Running task 3041 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 3063 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-178-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3064 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3065 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3066 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: Running task 3079 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-178-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_lic unihash changed to c1bdea9b31c3a913284a1ee075196b1c0949fc02cbc4c9459ea49ccef6f3b340
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3088 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: Running task 3089 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe diffoscope-178-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3090 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_configure)
NOTE: recipe harfbuzz-2.8.2-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3091 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3092 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3093 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe diffoscope-178-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 3094 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe python3-magic-0.4.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3095 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe diffoscope-178-r0: task do_configure: Succeeded
NOTE: Running task 3096 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_configure: Succeeded
NOTE: Running task 3097 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_compile)
NOTE: recipe python3-magic-0.4.24-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: Running task 3098 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3099 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-2.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 3100 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 69003abec21630d75e8d49ace4cba7ec76fcc8f9328d483319f958abafff2414
NOTE: Setscene tasks completed
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3137 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: Running task 3138 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: Running task 3145 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe python3-magic-0.4.24-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: Running task 3146 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3147 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe diffoscope-178-r0: task do_compile: Succeeded
NOTE: Running task 3148 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_install)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_compile: Succeeded
NOTE: Running task 3149 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_compile: Succeeded
NOTE: Running task 3150 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe diffoscope-178-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 3151 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3152 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe python3-magic-0.4.24-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3153 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: Running task 3154 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running task 3155 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Succeeded
NOTE: Running task 3156 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3157 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_install: Succeeded
NOTE: Running task 3158 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_install: Succeeded
NOTE: Running task 3159 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_package)
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Succeeded
NOTE: Running task 3160 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3161 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3162 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe diffoscope-178-r0: task do_install: Succeeded
NOTE: Running task 3163 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package)
NOTE: Running task 3164 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-178-r0: task do_package: Started
NOTE: recipe diffoscope-178-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package: Succeeded
NOTE: Running task 3165 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.24-r0: task do_package: Succeeded
NOTE: Running task 3166 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3167 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3168 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_package_write_rpm)
NOTE: Running task 3169 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_package_write_rpm)
NOTE: recipe diffoscope-178-r0: task do_package: Succeeded
NOTE: Running task 3170 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-178-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3171 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3172 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe diffoscope-178-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3173 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3174 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3175 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3176 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3177 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3178 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3179 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3180 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3181 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3182 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3183 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3184 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 3185 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3186 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3187 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 3188 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3189 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3190 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3192 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3193 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3195 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3196 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 3197 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3198 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3199 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 3200 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3201 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 3202 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3203 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3204 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 3205 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 3206 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3207 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3208 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 3209 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3210 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3211 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3212 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3213 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3214 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3215 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3216 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3217 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 3218 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 3219 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: Running task 3220 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 3221 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3222 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3223 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 3224 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3225 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3226 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3227 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: Running task 3228 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3229 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3230 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3231 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 3232 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 3233 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 3234 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3235 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3236 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3237 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3238 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3239 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3240 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3241 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3242 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3243 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 3244 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 3245 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3246 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3247 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3248 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 3249 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3250 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3251 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3252 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3253 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3254 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3255 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3256 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3257 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3258 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3259 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3260 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3261 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3262 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3263 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3264 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3265 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3266 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3267 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3268 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3269 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3270 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3271 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3272 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3273 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3274 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3275 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: Running task 3276 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3277 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3278 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3279 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3280 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3281 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3282 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 3283 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: Running task 3284 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: Running task 3285 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 3286 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: Running task 3287 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3288 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3289 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3290 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3291 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3292 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3293 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3294 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3295 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3296 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3297 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3298 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: Running task 3299 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3300 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 3301 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3302 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: Running task 3303 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3304 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3305 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: Running task 3306 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3307 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3308 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: Running task 3309 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3310 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3312 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
NOTE: recipe icu-69.1-r0: task do_package: Started
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3313 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3314 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3315 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3316 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3317 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3318 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3319 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3320 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3321 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3322 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3324 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3326 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3327 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3328 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3329 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3330 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3331 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3332 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3333 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3334 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3335 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3336 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3337 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3338 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3339 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3340 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3341 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3342 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3343 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3344 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3345 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3346 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3348 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_configure)
NOTE: recipe harfbuzz-2.8.2-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3349 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3350 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_configure: Succeeded
NOTE: Running task 3351 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_compile)
NOTE: recipe harfbuzz-2.8.2-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_compile: Succeeded
NOTE: Running task 3352 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_install)
NOTE: recipe harfbuzz-2.8.2-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_install: Succeeded
NOTE: Running task 3353 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_populate_sysroot)
NOTE: Running task 3354 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_package)
NOTE: recipe harfbuzz-2.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3355 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3356 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package: Succeeded
NOTE: Running task 3357 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3358 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3359 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3360 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3361 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3362 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3363 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3364 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: Running task 3365 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3366 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3367 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure)
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3368 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3369 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Succeeded
NOTE: Running task 3370 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_compile)
NOTE: recipe gtk+3-3.24.30-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_compile: Succeeded
NOTE: Running task 3371 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_install)
NOTE: recipe gtk+3-3.24.30-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_install: Succeeded
NOTE: Running task 3372 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_package)
NOTE: Running task 3373 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3374 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3379 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_package: Succeeded
NOTE: Running task 3380 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.30-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_packagedata: Succeeded
NOTE: Running task 3384 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.30-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3385 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3386 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3387 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3388 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3389 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3390 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package_write_rpm)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: Running task 3391 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package_qa)
NOTE: recipe diffoscope-178-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-178-r0: task do_package_qa: Started
NOTE: recipe diffoscope-178-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-178-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3392 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_build)
NOTE: Tasks Summary: Attempted 3392 tasks of which 2973 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============8546723495904830239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-177-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-178-py3.9.egg-info

--===============8546723495904830239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-eff2df9e92ba1fc5bbf5c265d5bae9de66d24943"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eff2df9e92ba1fc5bbf5c265d5bae9de66d24943"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 172 Local 5 Network 0 Missed 167 Current 901 (2% match, 84% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 915 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1336 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1380 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1388 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1458 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: Running task 1493 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1506 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1527 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: Running task 1585 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1586 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1605 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1618 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1619 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1620 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1652 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_fetch)
NOTE: Running task 1653 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1654 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1658 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1659 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1686 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1721 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: Running task 1726 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1745 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: Running task 1746 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1747 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1748 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1750 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1751 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: Running task 1752 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1782 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1785 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: Running task 1835 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.2-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1844 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1867 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 1878 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1898 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_unpack)
NOTE: Running task 1909 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: Running task 1950 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: Running task 1955 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_write_config)
NOTE: Running task 1956 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1957 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1965 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1978 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1979 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 1989 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2009 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: Running task 2011 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: Running task 2033 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 2034 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2035 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2036 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2056 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 2071 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: Running task 2072 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2082 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: Running task 2101 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe harfbuzz-2.8.2-r0: task do_unpack: Started
NOTE: Running task 2129 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_fetch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: Running task 2145 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: Running task 2176 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: Running task 2190 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2191 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2192 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 2193 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: Running task 2197 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2198 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2208 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2234 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: Running task 2236 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2249 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 2278 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_fetch)
NOTE: Running task 2279 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2306 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2307 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2308 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 2309 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: Running task 2323 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2345 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_fetch)
NOTE: Running task 2346 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_fetch)
NOTE: Running task 2348 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2349 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: Running task 2391 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2392 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: Running task 2408 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2409 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 2441 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_unpack)
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2468 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: Running task 2480 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2481 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2482 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe diffoscope-178-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_fetch: Started
NOTE: Running task 2483 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2484 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2485 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_unpack)
NOTE: Running task 2486 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.24-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2501 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_unpack)
NOTE: Running task 2511 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_unpack)
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2535 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 2536 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2566 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2567 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: Running task 2568 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2569 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: Running task 2570 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2596 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-178-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2642 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2657 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 2658 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_unpack: Started
NOTE: Running task 2659 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2660 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: Running task 2661 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2662 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe python3-magic-0.4.24-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2663 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_patch)
NOTE: recipe diffoscope-178-r0: task do_unpack: Succeeded
NOTE: Running task 2677 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_patch)
NOTE: recipe diffoscope-178-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2678 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: Running task 2700 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2726 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2757 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2801 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2821 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2822 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2832 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: Running task 2845 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: Running task 2846 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2866 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2905 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 2906 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2914 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2936 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: Running task 2954 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2991 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2992 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2993 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2994 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 2995 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2996 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2997 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2998 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2999 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3000 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3001 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 3002 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 3003 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 3004 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 3005 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3006 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3007 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 3008 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3009 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3010 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3011 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: Running task 3012 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3013 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: Running task 3014 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_deploy_source_date_epoch)
NOTE: Running task 3015 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_lic)
NOTE: Running task 3016 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe diffoscope-178-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3017 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe python3-magic-0.4.24-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3018 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3019 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 70910aa6f5200a5576064a1a8f4bf358162b2cfea2e677eff1e3ac4e51e30845
NOTE: recipe python3-magic-0.4.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-178-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3038 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: Running task 3039 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_patch)
NOTE: Running task 3044 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3066 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.24-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3067 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: Running task 3068 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 3082 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 3090 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe diffoscope-178-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_lic unihash changed to c1bdea9b31c3a913284a1ee075196b1c0949fc02cbc4c9459ea49ccef6f3b340
NOTE: recipe diffoscope-178-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3091 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_configure)
NOTE: recipe harfbuzz-2.8.2-r0: task do_patch: Succeeded
NOTE: Running task 3092 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3093 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe python3-magic-0.4.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3094 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_configure: Started
NOTE: Running task 3095 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe diffoscope-178-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3096 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: recipe diffoscope-178-r0: task do_configure: Succeeded
NOTE: Running task 3097 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_compile)
NOTE: Running task 3098 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_configure: Succeeded
NOTE: Running task 3099 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 3100 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3101 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-2.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 3102 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe diffoscope-178-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3103 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: Running task 3104 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3105 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 531ff89e61a44056ea795b323115f489e696f558da7386c12095418e49c4082e
NOTE: Setscene tasks completed
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3112 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: Running task 3142 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe diffoscope-178-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_compile: Succeeded
NOTE: Running task 3149 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_install)
NOTE: Running task 3150 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3151 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 3152 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3153 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-178-r0: task do_install: Started
NOTE: Running task 3154 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3155 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3156 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3157 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Succeeded
NOTE: Running task 3158 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_install: Succeeded
NOTE: Running task 3159 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3160 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_install: Succeeded
NOTE: Running task 3161 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_package)
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package: Started
NOTE: recipe diffoscope-178-r0: task do_install: Succeeded
NOTE: Running task 3162 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package)
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Succeeded
NOTE: Running task 3163 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_deploy_source_date_epoch)
NOTE: Running task 3164 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-178-r0: task do_package: Started
NOTE: recipe diffoscope-178-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package: Succeeded
NOTE: Running task 3165 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_package: Succeeded
NOTE: Running task 3166 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_packagedata: Started
NOTE: recipe diffoscope-178-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3167 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3168 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3169 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe python3-magic-0.4.24-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe diffoscope-178-r0: task do_package: Succeeded
NOTE: Running task 3170 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3171 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3172 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe diffoscope-178-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3173 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe diffoscope-178-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3174 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3175 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3176 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3177 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3178 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3179 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 3180 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 3181 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3182 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3183 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3184 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3186 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3187 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3188 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3189 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3190 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3191 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3192 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3193 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3194 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 3195 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3196 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3197 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3198 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3199 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3200 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3201 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 3202 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3203 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3204 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: Running task 3205 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3206 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3207 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 3208 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: Running task 3209 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3210 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3211 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3212 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3213 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: Running task 3214 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3215 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3216 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: Running task 3217 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: Running task 3218 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3219 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 3220 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3221 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3222 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: Running task 3223 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3224 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3225 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 3226 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3227 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 3228 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3229 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3230 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3231 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3232 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 3233 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3234 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 3235 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 3236 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3237 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3238 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3239 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3240 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3241 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3242 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3243 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 3244 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3245 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3246 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 3247 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3248 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3249 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3250 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 3251 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3252 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3253 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3254 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3255 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3256 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3257 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3258 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3259 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3260 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3261 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3262 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3263 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3264 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3265 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3266 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3267 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3268 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3269 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3270 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3271 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3272 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3273 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: Running task 3274 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3275 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3276 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3277 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 3278 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 3279 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: Running task 3280 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3281 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3282 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3283 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3284 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3285 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 3286 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: Running task 3287 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: Running task 3288 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3289 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3290 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3291 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3292 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3293 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3294 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3295 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3296 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3297 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3298 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3299 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3300 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: Running task 3301 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3302 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3303 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3304 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3305 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3306 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3307 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3308 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3309 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3310 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3311 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3312 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3313 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3314 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3315 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3316 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3317 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3318 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3319 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3320 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3321 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3322 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3323 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3324 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3326 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3328 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3329 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3330 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3331 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3332 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3333 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3334 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3335 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3336 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3337 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3338 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3339 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3340 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3341 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: Running task 3342 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3343 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3344 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3345 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3346 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3348 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_configure)
NOTE: recipe harfbuzz-2.8.2-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3349 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3350 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_configure: Succeeded
NOTE: Running task 3351 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_compile)
NOTE: recipe harfbuzz-2.8.2-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_compile: Succeeded
NOTE: Running task 3352 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_install)
NOTE: recipe harfbuzz-2.8.2-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_install: Succeeded
NOTE: Running task 3353 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_populate_sysroot)
NOTE: Running task 3354 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_package)
NOTE: recipe harfbuzz-2.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3355 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3356 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package: Succeeded
NOTE: Running task 3357 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3358 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3359 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3360 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3361 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3362 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3363 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3364 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: Running task 3365 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3366 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3367 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure)
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3368 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3369 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Succeeded
NOTE: Running task 3370 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_compile)
NOTE: recipe gtk+3-3.24.30-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_compile: Succeeded
NOTE: Running task 3371 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_install)
NOTE: recipe gtk+3-3.24.30-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_install: Succeeded
NOTE: Running task 3372 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_package)
NOTE: Running task 3373 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3374 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3379 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_package: Succeeded
NOTE: Running task 3380 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.30-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_packagedata: Succeeded
NOTE: Running task 3384 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.30-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3385 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3386 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3387 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3388 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3389 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3390 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package_write_rpm)
NOTE: Running task 3391 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-178-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-178-r0: task do_package_qa: Started
NOTE: recipe diffoscope-178-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-178-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3392 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_build)
NOTE: Tasks Summary: Attempted 3392 tasks of which 2973 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============8546723495904830239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-eff2df9e92ba1fc5bbf5c265d5bae9de66d24943"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eff2df9e92ba1fc5bbf5c265d5bae9de66d24943"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 172 Local 5 Network 0 Missed 167 Current 901 (2% match, 84% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 915 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1073 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1191 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1336 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1380 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1388 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1458 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: Running task 1493 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1506 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1527 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1585 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1586 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1587 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1607 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1608 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1621 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1629 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1654 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1655 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_fetch)
NOTE: Running task 1656 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: Running task 1686 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: Running task 1698 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1711 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1718 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1719 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1725 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: Running task 1726 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: Running task 1750 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1751 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: Running task 1758 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: Running task 1782 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1785 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: Running task 1787 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.2-r0: task do_fetch: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1809 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.2-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1819 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_unpack)
NOTE: Running task 1820 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: Running task 1821 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1840 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1848 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1872 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 1901 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: Running task 1914 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1959 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_write_config)
NOTE: Running task 1960 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1961 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1969 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: Running task 1982 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1992 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1999 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: Running task 2012 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2015 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: Running task 2037 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: Running task 2038 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: Running task 2039 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2040 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: Running task 2083 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 2092 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 2130 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_fetch)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2146 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: Running task 2147 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2163 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 2192 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2193 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2194 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 2195 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: Running task 2199 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: Running task 2200 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2245 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: Running task 2246 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 2278 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_fetch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: Running task 2290 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 2304 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: Running task 2323 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2324 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2325 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: Running task 2339 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2340 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: Running task 2341 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: Running task 2347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2348 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2349 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_fetch)
NOTE: Running task 2350 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2351 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2390 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe diffoscope-178-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2409 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-178-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2410 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: Running task 2412 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2413 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_unpack)
NOTE: Running task 2414 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2415 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2416 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_unpack)
NOTE: Running task 2417 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: Running task 2418 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: Running task 2419 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2420 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2421 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2437 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: Running task 2495 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2544 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2545 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_unpack)
NOTE: Running task 2551 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: Running task 2556 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 2561 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Started
NOTE: Running task 2572 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2573 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2578 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2591 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 2592 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2593 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: Running task 2615 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: Running task 2644 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: Running task 2664 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-178-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_unpack: Started
NOTE: Running task 2665 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_patch)
NOTE: Running task 2666 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe diffoscope-178-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: Running task 2697 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_patch)
NOTE: recipe python3-magic-0.4.24-r0: task do_unpack: Succeeded
NOTE: Running task 2706 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2716 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 2730 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_patch: Started
NOTE: Running task 2781 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2853 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2854 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2858 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: Running task 2861 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2872 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2880 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_patch: Started
NOTE: Running task 2905 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2906 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 2907 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2908 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: Running task 2938 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: Running task 2950 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2994 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: Running task 2995 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 994964385f6ac588debff6649b2bcee96d470267242d45df0b9a617d8aa01f86
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 3014 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3019 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3029 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 3032 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 3033 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3034 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3045 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3046 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3047 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 3048 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 3049 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3050 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3051 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: Running task 3064 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3073 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3074 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3075 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3076 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3077 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3078 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 3079 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: Running task 3080 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_patch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3081 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3082 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3083 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe harfbuzz-2.8.2-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_patch: Succeeded
NOTE: Running task 3084 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 3085 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3086 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3087 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe diffoscope-178-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 3088 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_deploy_source_date_epoch)
NOTE: Running task 3089 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_lic)
NOTE: recipe harfbuzz-2.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-178-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3090 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_configure)
NOTE: Running task 3091 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: Running task 3092 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe diffoscope-178-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-178-r0: task do_populate_lic: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d505b3a40ada80a814d775ee23d14cf06a96c4aededb01057d9908a933216865
NOTE: Setscene tasks completed
NOTE: Running task 3128 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 3129 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe python3-magic-0.4.24-r0: task do_configure: Succeeded
NOTE: Running task 3136 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_compile)
NOTE: recipe diffoscope-178-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3137 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-178-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_lic unihash changed to c1bdea9b31c3a913284a1ee075196b1c0949fc02cbc4c9459ea49ccef6f3b340
NOTE: Running task 3138 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3139 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 3140 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3141 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_compile: Started
NOTE: recipe diffoscope-178-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 3142 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-178-r0: task do_configure: Succeeded
NOTE: Running task 3143 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3144 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_configure: Succeeded
NOTE: Running task 3145 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe diffoscope-178-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3146 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.24-r0: task do_compile: Succeeded
NOTE: Running task 3147 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_compile: Started
NOTE: Running task 3148 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3149 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3150 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3151 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_compile: Succeeded
NOTE: Running task 3152 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3153 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_install)
NOTE: recipe diffoscope-178-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 3154 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3155 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_install: Started
NOTE: recipe diffoscope-178-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3156 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Succeeded
NOTE: Running task 3157 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_install: Succeeded
NOTE: Running task 3158 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_package)
NOTE: recipe python3-magic-0.4.24-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3159 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_install: Succeeded
NOTE: Running task 3160 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_package)
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Succeeded
NOTE: Running task 3161 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3162 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_install: Succeeded
NOTE: Running task 3163 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package)
NOTE: Running task 3164 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.24-r0: task do_package: Succeeded
NOTE: recipe diffoscope-178-r0: task do_populate_sysroot: Started
NOTE: Running task 3165 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_packagedata)
NOTE: recipe diffoscope-178-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package: Succeeded
NOTE: Running task 3166 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-178-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3167 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3168 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe python3-magic-0.4.24-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3169 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3170 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3171 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-178-r0: task do_package: Succeeded
NOTE: Running task 3172 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_packagedata)
NOTE: recipe diffoscope-178-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3173 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe diffoscope-178-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3174 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3175 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: Running task 3176 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3177 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3178 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3179 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3180 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3181 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3182 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3183 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3184 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3185 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 3186 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3187 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 3189 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3190 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3192 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3193 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3194 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3195 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3196 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 3197 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 3198 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3199 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3200 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3201 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 3202 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3203 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 3204 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3205 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 3206 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3207 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3208 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3209 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: Running task 3210 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 3211 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3212 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3213 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 3214 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: Running task 3215 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3216 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3217 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: Running task 3218 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3219 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3220 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3221 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 3222 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3223 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 3224 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 3225 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3226 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3227 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3228 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3229 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: Running task 3230 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 3231 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3232 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3233 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3234 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3235 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3236 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3237 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3238 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3239 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3240 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3241 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 3242 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 3243 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3244 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3245 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3246 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3247 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3248 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 3249 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3250 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3251 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3252 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3253 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3254 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3255 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3256 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3257 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3258 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3259 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3260 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3261 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3262 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3263 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3264 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3265 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3266 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3267 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: Running task 3268 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: Running task 3269 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3270 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3271 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3272 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3273 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3274 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3275 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: Running task 3276 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3277 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3278 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3279 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3280 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3281 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 3282 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3283 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: Running task 3284 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 3285 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: Running task 3286 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: Running task 3287 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3288 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3289 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3290 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3291 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3292 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3293 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3294 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3295 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3296 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3297 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 3298 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3299 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: Running task 3300 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3301 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3302 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3303 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3304 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3305 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3306 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3307 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3308 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3309 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3310 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3311 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: Running task 3312 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: Running task 3313 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3314 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3315 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3316 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3317 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3318 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3319 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3320 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3321 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3322 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3324 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3326 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3327 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3328 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3329 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3330 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3331 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3332 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3333 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3334 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3335 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3336 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3337 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3338 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3339 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3340 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3341 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3342 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3343 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3344 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3345 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3346 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3347 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3348 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_configure)
NOTE: recipe harfbuzz-2.8.2-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3349 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3350 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_configure: Succeeded
NOTE: Running task 3351 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_compile)
NOTE: recipe harfbuzz-2.8.2-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_compile: Succeeded
NOTE: Running task 3352 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_install)
NOTE: recipe harfbuzz-2.8.2-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_install: Succeeded
NOTE: Running task 3353 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_populate_sysroot)
NOTE: Running task 3354 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_package)
NOTE: recipe harfbuzz-2.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3355 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3356 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package: Succeeded
NOTE: Running task 3357 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3358 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3359 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3360 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3361 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3362 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3363 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3364 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: Running task 3365 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3366 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3367 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure)
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3368 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3369 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Succeeded
NOTE: Running task 3370 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_compile)
NOTE: recipe gtk+3-3.24.30-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_compile: Succeeded
NOTE: Running task 3371 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_install)
NOTE: recipe gtk+3-3.24.30-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_install: Succeeded
NOTE: Running task 3372 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_package)
NOTE: Running task 3373 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3374 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3379 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_package: Succeeded
NOTE: Running task 3380 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.30-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_packagedata: Succeeded
NOTE: Running task 3384 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.30-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3385 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3386 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3387 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3388 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3389 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3390 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package_write_rpm)
NOTE: Running task 3391 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-178-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-178-r0: task do_package_qa: Started
NOTE: recipe diffoscope-178-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-178-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3392 of 3392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_build)
NOTE: Tasks Summary: Attempted 3392 tasks of which 2973 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============8546723495904830239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (820 cached, 1 parsed). 1458 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-eff2df9e92ba1fc5bbf5c265d5bae9de66d24943"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eff2df9e92ba1fc5bbf5c265d5bae9de66d24943"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 176 Local 9 Network 0 Missed 167 Current 901 (5% match, 84% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 913 of 1077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 916 of 1077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 918 of 1077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 926 of 1077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1063 of 1077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1064 of 1077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1065 of 1077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1077 of 1077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1191 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1336 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1347 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1380 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1388 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1458 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: Running task 1493 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1506 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1527 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1585 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1588 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1600 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: Running task 1608 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1613 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1614 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1630 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1638 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1656 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_fetch)
NOTE: Running task 1657 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1658 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1688 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1716 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1728 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1740 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: Running task 1741 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1742 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running task 1743 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1756 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1757 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_fetch: Started
NOTE: Running task 1789 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: Running task 1806 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1816 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1817 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1818 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1824 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_unpack)
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: Running task 1856 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: Running task 1857 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: Running task 1888 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1927 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1929 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: Running task 1962 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1975 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_write_config)
NOTE: Running task 1976 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1977 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: Running task 1978 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: Running task 1986 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: Running task 1999 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 2009 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_unpack: Started
NOTE: Running task 2016 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2017 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: Running task 2032 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: Running task 2054 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 2055 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2056 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_fetch)
NOTE: Running task 2057 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2075 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2101 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 2109 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe harfbuzz-2.8.2-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2148 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 2164 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2208 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 2209 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2210 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2211 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: Running task 2215 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_write_config)
NOTE: Running task 2216 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2217 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2275 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: Running task 2285 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 2294 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2295 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Started
NOTE: Running task 2296 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2298 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_fetch)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: Running task 2318 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2319 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 2320 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.8-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: Running task 2342 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2359 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_fetch)
NOTE: Running task 2365 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2366 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2367 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_fetch)
NOTE: Running task 2368 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2399 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 2400 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2401 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2402 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2409 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 2423 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 2424 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2425 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2426 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_unpack)
NOTE: Running task 2427 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: recipe diffoscope-178-r0: task do_fetch: Started
NOTE: Running task 2428 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2429 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2430 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-178-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: Running task 2466 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_unpack)
NOTE: recipe python3-magic-0.4.24-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2482 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2490 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.24-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2516 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2517 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 2518 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2526 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_unpack)
NOTE: Running task 2527 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: Running task 2528 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_unpack)
NOTE: Running task 2529 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2572 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: Running task 2584 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 2585 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2594 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Started
NOTE: recipe diffoscope-178-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2641 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2642 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.24-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2681 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2682 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2683 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe diffoscope-178-r0: task do_unpack: Succeeded
NOTE: Running task 2684 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2685 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_patch)
NOTE: Running task 2686 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: Running task 2687 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 2688 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_patch)
NOTE: Running task 2689 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2690 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 2691 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_patch)
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe diffoscope-178-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2692 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: Running task 2693 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: Running task 2707 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2734 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2756 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2757 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-magic-0.4.24-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2820 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2845 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-178-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_patch: Started
NOTE: Running task 2903 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Started
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 3011 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3012 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: Running task 3013 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3014 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3015 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3016 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 3017 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3018 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 3019 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3020 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe python3-magic-0.4.24-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_patch: Succeeded
NOTE: Running task 3021 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 3022 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: Running task 3023 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3024 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 3025 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3026 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 3027 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 3028 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8575f60d419eabdaaae3a37e8422c8caedda7884d40ee20858a504b96e1e4fe6
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3047 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3052 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3060 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3075 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3076 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: Running task 3089 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3098 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3099 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3100 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3101 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe diffoscope-178-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3102 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_deploy_source_date_epoch)
NOTE: Running task 3103 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_lic)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-178-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3104 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_patch)
NOTE: Running task 3105 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3106 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe python3-magic-0.4.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3107 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe diffoscope-178-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-178-r0: task do_populate_lic: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3108 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3109 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 3110 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.24-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe diffoscope-178-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_lic unihash changed to c1bdea9b31c3a913284a1ee075196b1c0949fc02cbc4c9459ea49ccef6f3b340
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 3111 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_configure: Succeeded
NOTE: Running task 3112 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_compile)
NOTE: recipe harfbuzz-2.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-178-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3113 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3114 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 3115 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_configure: Succeeded
NOTE: Running task 3116 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_compile)
NOTE: recipe diffoscope-178-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3fccbe62c8e32893a85996d541fa163f3964128b381f8be7d99c1760acce381e
NOTE: Setscene tasks completed
NOTE: recipe harfbuzz-2.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3152 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 3159 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe diffoscope-178-r0: task do_configure: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 3160 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_compile)
NOTE: Running task 3161 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 3162 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3163 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.24-r0: task do_compile: Succeeded
NOTE: Running task 3164 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe diffoscope-178-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: Running task 3165 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_compile: Succeeded
NOTE: Running task 3166 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3167 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: Running task 3168 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3169 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe diffoscope-178-r0: task do_compile: Succeeded
NOTE: Running task 3170 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3171 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3172 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-178-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3173 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_install: Succeeded
NOTE: Running task 3174 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3175 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.24-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_install: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Succeeded
NOTE: Running task 3176 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_patch)
NOTE: Running task 3177 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3178 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Succeeded
NOTE: Running task 3180 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_package: Succeeded
NOTE: Running task 3181 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_packagedata: Started
NOTE: recipe diffoscope-178-r0: task do_install: Succeeded
NOTE: Running task 3182 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package)
NOTE: Running task 3183 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package: Succeeded
NOTE: Running task 3184 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe diffoscope-178-r0: task do_package: Started
NOTE: recipe diffoscope-178-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-3.1-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3186 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.24.bb:do_package_write_rpm)
NOTE: recipe diffoscope-178-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.24-r0: task do_package_write_rpm: Started
NOTE: Running task 3187 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3189 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-178-r0: task do_package: Succeeded
NOTE: Running task 3190 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_packagedata)
NOTE: recipe diffoscope-178-r0: task do_packagedata: Started
NOTE: recipe diffoscope-178-r0: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 3192 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3193 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3194 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3195 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3196 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3197 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3198 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3199 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3200 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 3201 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 3202 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 3203 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3204 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 3205 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3206 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3207 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3208 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3209 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3210 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3211 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3212 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3213 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 3214 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3215 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3216 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 3217 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3218 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: Running task 3219 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3220 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 3221 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 3222 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3223 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3224 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3225 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 3226 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 3227 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 3228 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 3229 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: Running task 3230 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3231 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3232 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 3233 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3234 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3235 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3236 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3237 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3238 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3239 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3240 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 3241 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 3242 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3243 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3244 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3245 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3246 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 3247 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: Running task 3248 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3249 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3250 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 3251 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: Running task 3252 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 3253 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 3254 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3255 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3256 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3257 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3258 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3259 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 3260 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3261 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3262 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 3263 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3264 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3265 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 3266 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3267 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 3268 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 3269 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3270 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3271 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3272 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3273 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3274 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3275 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3276 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3277 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3278 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3279 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3280 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 3281 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3282 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3283 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3284 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3285 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3286 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: Running task 3287 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3288 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3289 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3290 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3291 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3292 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3293 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: Running task 3294 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3295 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3296 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3297 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3298 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3299 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: Running task 3300 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: Running task 3301 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3302 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: Running task 3303 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3304 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3305 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3306 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3307 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3308 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3309 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3310 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 3311 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3312 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3313 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3314 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3315 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3316 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3317 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3318 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 3319 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 3320 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3321 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3322 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3323 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3324 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3325 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3326 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3327 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3328 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3329 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3330 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3331 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3332 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3334 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 3336 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3337 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3338 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3339 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3340 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3341 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3342 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3343 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3344 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3345 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 3346 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 3347 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: Running task 3348 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3349 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3350 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3351 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_configure)
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3352 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_configure: Succeeded
NOTE: Running task 3353 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_compile)
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: Running task 3354 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
ERROR: mesa-2_21.1.4-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.5-r0 to 2:21.1.4-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3355 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_compile: Succeeded
NOTE: Running task 3356 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_install)
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_install: Succeeded
NOTE: Running task 3357 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot)
NOTE: Running task 3358 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package)
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_package: Succeeded
NOTE: Running task 3359 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3360 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3361 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3362 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3363 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3364 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3365 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3366 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_configure)
NOTE: recipe harfbuzz-2.8.2-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3367 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3368 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_configure: Succeeded
NOTE: Running task 3369 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_compile)
NOTE: recipe harfbuzz-2.8.2-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.2-r0: task do_compile: Succeeded
NOTE: Running task 3370 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_install)
NOTE: recipe harfbuzz-2.8.2-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_install: Succeeded
NOTE: Running task 3371 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_populate_sysroot)
NOTE: Running task 3372 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_package)
NOTE: recipe harfbuzz-2.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3373 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3374 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package: Succeeded
NOTE: Running task 3375 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3376 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3377 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3378 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3379 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3380 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3381 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3382 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: Running task 3383 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3384 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3385 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure)
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3386 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3387 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Succeeded
NOTE: Running task 3388 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_compile)
NOTE: recipe gtk+3-3.24.30-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_compile: Succeeded
NOTE: Running task 3389 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_install)
NOTE: recipe gtk+3-3.24.30-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_install: Succeeded
NOTE: Running task 3390 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_package)
NOTE: Running task 3391 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3392 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3397 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_package: Succeeded
NOTE: Running task 3398 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.30-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_packagedata: Succeeded
NOTE: Running task 3402 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.30-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3403 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3404 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3405 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3406 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3407 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3408 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package_write_rpm)
NOTE: Running task 3409 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-178-r0: task do_package_qa: Started
NOTE: recipe diffoscope-178-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-178-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-178-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3410 of 3410 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_178.bb:do_build)
NOTE: Tasks Summary: Attempted 3410 tasks of which 2991 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============8546723495904830239==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-177-178.patch"

From 2a7c84d492bf334967f56647a427ca62552c2b82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 09:02:36 +0000
Subject: [PATCH] diffoscope: upgrade 177 -> 178

---
 .../diffoscope/{diffoscope_177.bb => diffoscope_178.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_177.bb => diffoscope_178.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_177.bb b/meta/recipes-support/diffoscope/diffoscope_178.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_177.bb
rename to meta/recipes-support/diffoscope/diffoscope_178.bb
index 0d9061dda0..4bf6ee64c9 100644
--- a/meta/recipes-support/diffoscope/diffoscope_177.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_178.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8ac0cad150914bab2a53caa3f21876a78b092f3d2a36b9134874cd5c04a26b2e"
+SRC_URI[sha256sum] = "7454cf417725ef81ffad16e8cc2f62753282f5171b1c651732b99c0b3c19e137"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.27.0


--===============8546723495904830239==--
