Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5882.1626056249052267104
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0376338C12BB
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:28 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.32.2 SUCCEEDED
Message-ID: <MADEUP.1690E98B26483A9C.19620@lists.openembedded.org>
X-Groupsio-MsgNum: 153758
Content-Type: multipart/mixed; boundary="===============4746556867147746815=="

--===============4746556867147746815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.32.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.32.1-2.32.2.patch
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

--===============4746556867147746815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 61 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 200 Local 8 Network 0 Missed 192 Current 1033 (4% match, 84% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1044 of 1233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1159 of 1233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: Running task 1196 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1192 of 1233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running task 1566 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1567 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1568 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1569 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1570 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: Running task 1682 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1687 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_fetch)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running task 1748 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1749 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1755 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1794 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1795 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1796 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1797 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1798 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: Running task 1799 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: Running task 1800 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1801 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Started
NOTE: Running task 1817 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: Running task 1853 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: Running task 1864 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_unpack)
NOTE: Running task 1871 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1872 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1967 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2059 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2060 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 2101 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: Running task 2113 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2129 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: Running task 2130 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: Running task 2131 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_fetch)
NOTE: Running task 2137 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_fetch)
NOTE: Running task 2147 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2177 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_fetch)
NOTE: Running task 2178 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: Running task 2179 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_fetch)
NOTE: Running task 2185 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2186 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2188 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_fetch)
NOTE: Running task 2190 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2193 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2219 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2225 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2230 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: Running task 2241 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 2247 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2248 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_fetch)
NOTE: Running task 2250 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_fetch)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 2266 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Started
NOTE: Running task 2267 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2268 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 2281 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_unpack)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2289 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_unpack)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: Running task 2302 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2307 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2315 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2320 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 2323 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Started
NOTE: Running task 2324 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: Running task 2325 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_unpack)
NOTE: Running task 2326 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 2330 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_unpack)
NOTE: Running task 2336 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: Running task 2341 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-236-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 2342 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe libgudev-236-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2343 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_unpack)
NOTE: Running task 2344 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe vala-0.52.4-r0: task do_fetch: Started
NOTE: Running task 2345 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2346 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_unpack)
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe vala-0.52.4-r0: task do_fetch: Succeeded
NOTE: Running task 2360 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_unpack)
NOTE: Running task 2361 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 2362 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_fetch)
NOTE: Running task 2363 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: Running task 2364 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: Running task 2365 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2366 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_fetch)
NOTE: Running task 2367 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: Running task 2368 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_fetch)
NOTE: Running task 2369 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: Running task 2403 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: Running task 2404 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2412 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 2414 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Succeeded
NOTE: Running task 2415 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Started
NOTE: Running task 2416 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_patch)
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2425 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_write_config)
NOTE: Running task 2426 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2427 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_patch)
NOTE: Running task 2428 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: Running task 2436 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: Running task 2437 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2438 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: recipe vala-0.52.4-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe libgudev-236-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: Running task 2439 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Started
NOTE: Running task 2440 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 2441 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_patch)
NOTE: Running task 2442 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2462 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2470 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2471 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2479 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: Running task 2488 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: Running task 2489 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_unpack)
NOTE: Running task 2490 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: Running task 2491 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_patch)
NOTE: Running task 2492 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: Running task 2493 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_patch)
NOTE: Running task 2494 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_unpack)
NOTE: Running task 2495 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2496 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: Running task 2497 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libgudev-236-r0: task do_unpack: Succeeded
NOTE: Running task 2498 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: Running task 2499 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2500 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 2501 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_patch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2502 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: Running task 2503 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_unpack)
NOTE: Running task 2504 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2511 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_fetch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2517 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_write_config)
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2519 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 2521 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_generate_toolchain_file)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2522 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2527 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Started
NOTE: Running task 2528 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: Running task 2529 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2532 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_write_config)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Started
NOTE: Running task 2592 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe iso-codes-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-236-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2596 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2598 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2607 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-236-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2608 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2609 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2610 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2611 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2612 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: Running task 2613 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2614 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgudev-236-r0: task do_write_config: Succeeded
NOTE: Running task 2615 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Succeeded
NOTE: Running task 2619 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2620 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: Running task 2626 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_patch)
NOTE: Running task 2627 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_patch)
NOTE: recipe libgudev-236-r0: task do_patch: Succeeded
NOTE: Running task 2637 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2650 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2660 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2661 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2664 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 2665 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_write_config)
NOTE: Running task 2666 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: Running task 2667 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: Running task 2668 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2669 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2670 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2671 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 2672 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: Running task 2673 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_write_config)
NOTE: Running task 2674 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2675 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Started
NOTE: Running task 2676 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2680 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Started
NOTE: Running task 2682 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: Running task 2705 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2711 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2712 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: recipe vala-0.52.4-r0: task do_unpack: Succeeded
NOTE: Running task 2713 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_patch)
NOTE: Running task 2714 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Succeeded
NOTE: Running task 2715 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: Running task 2726 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2744 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2754 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2769 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2774 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Started
NOTE: Running task 2775 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 2776 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Started
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2810 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe vala-0.52.4-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2868 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: Running task 2869 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_configure)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2870 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2871 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5aee81357375e47dc74dc1ce0f9da0415214c11d6cfe8e8cec85f100f054322d
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2935 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.52.4-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2940 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2941 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2942 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2953 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2960 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: Running task 2963 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2966 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_compile)
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2967 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2971 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2972 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2973 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Started
NOTE: Running task 2975 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2976 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2977 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2978 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2979 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2980 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2984 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2985 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2986 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2987 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 2988 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3042 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Started
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3324 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3486 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_configure)
NOTE: Running task 3487 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: Running task 3488 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Succeeded
NOTE: Running task 3489 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3490 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1ba205c5dff935439a6ba9665c1d19358d3b94d9a604c5237ddb3df6adced49e
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 3538 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3554 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3555 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3556 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3557 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3558 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 3559 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3560 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3561 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3562 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3563 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: Running task 3564 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_configure)
NOTE: recipe vala-0.52.4-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3565 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 3566 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Succeeded
NOTE: Running task 3567 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_patch)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Started
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3568 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3569 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3570 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Succeeded
NOTE: Running task 3571 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_generate_toolchain_file)
NOTE: Running task 3572 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3573 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic unihash changed to 8d61fad4acdf68670fe6ed7b59f61ec3fac19d58ee10e0ac9ed6542b8a7ccc4b
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3574 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libgudev-236-r0: task do_configure: Succeeded
NOTE: Running task 3575 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_compile)
NOTE: recipe libgudev-236-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Succeeded
NOTE: Running task 3576 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3577 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3578 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3579 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3580 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3581 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3582 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3583 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3584 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3585 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3586 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3587 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3588 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3589 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3590 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3591 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure_ptest_base)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 3592 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3593 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile)
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: Running task 3594 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Succeeded
NOTE: Running task 3595 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3596 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3597 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 3598 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_install)
NOTE: recipe libwpe-1.10.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libwpe-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 3599 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 3600 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package)
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Succeeded
NOTE: Running task 3601 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile_ptest_base)
NOTE: recipe libwpe-1.10.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3602 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install)
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3603 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3604 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3605 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3606 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_compile)
NOTE: recipe libgudev-236-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: Running task 3607 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3608 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libgudev-236-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3609 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: Running task 3610 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3611 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3612 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_install: Succeeded
NOTE: Running task 3613 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_populate_sysroot)
NOTE: Running task 3614 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-236-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3615 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3616 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: Running task 3617 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3618 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3619 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libwpe-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 3620 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Succeeded
NOTE: Running task 3621 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 3622 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3623 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3624 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Started
NOTE: Running task 3625 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3626 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: Running task 3627 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Succeeded
NOTE: Running task 3628 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3629 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3630 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3631 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3632 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 3633 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3634 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: Running task 3635 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3636 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Started
NOTE: Running task 3637 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install_ptest_base)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3638 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3639 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3640 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3641 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-236-r0: task do_package: Succeeded
NOTE: Running task 3642 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3643 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3644 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe vala-0.52.4-r0: task do_configure: Succeeded
NOTE: Running task 3645 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3646 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Started
NOTE: recipe libgudev-236-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_compile: Started
NOTE: Running task 3647 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: Running task 3648 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3649 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3650 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 3651 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-236-r0: task do_packagedata: Succeeded
NOTE: Running task 3652 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3653 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: Running task 3654 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3655 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_packagedata)
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 3656 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3657 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3658 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3659 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3660 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3661 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3662 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3663 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 3664 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3665 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: Running task 3666 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3667 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3668 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3669 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3670 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 3671 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package)
NOTE: Running task 3672 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3673 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3674 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm)
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3675 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Succeeded
NOTE: Running task 3676 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3677 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3678 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: Running task 3679 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 3680 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3681 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3682 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3683 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 3684 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3685 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3686 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: Running task 3687 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3688 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3689 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3690 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_install)
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3691 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3692 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3693 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3694 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3695 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: Running task 3696 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: Running task 3697 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: Running task 3698 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: Running task 3699 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: Running task 3700 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libwebp-1.2.0-r0: task do_install: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package: Started
NOTE: Running task 3701 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Started
NOTE: Running task 3702 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3703 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 3704 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3705 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3706 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3707 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 3708 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3709 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: Running task 3710 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3711 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile_ptest_base)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3712 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3713 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3714 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3715 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3716 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3717 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3718 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3719 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Succeeded
NOTE: Running task 3720 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_packagedata)
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3721 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_configure)
NOTE: recipe libwebp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3722 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3723 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3724 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3725 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 3726 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_install)
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 3727 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3728 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install_ptest_base)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3729 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Succeeded
NOTE: Running task 3730 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package)
NOTE: Running task 3731 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3732 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3733 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3734 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3735 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 3736 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Succeeded
NOTE: Running task 3737 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_packagedata)
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3738 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3739 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3740 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package_write_rpm)
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 3741 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 3742 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3743 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: Running task 3744 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 3745 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3746 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package_write_rpm)
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3747 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3748 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3749 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3750 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3751 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3752 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3753 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3754 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe vala-0.52.4-r0: task do_compile: Succeeded
NOTE: Running task 3755 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe vala-0.52.4-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3756 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3757 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3758 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_install: Succeeded
NOTE: Running task 3759 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_populate_sysroot)
NOTE: Running task 3760 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package)
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Started
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3761 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3762 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3763 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3764 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3765 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Succeeded
NOTE: Running task 3766 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_packagedata)
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3767 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package_write_rpm)
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: Running task 3768 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3769 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3770 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 3771 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 3772 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: Running task 3773 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3774 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3775 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 3776 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3777 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3778 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: Running task 3779 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3780 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package_write_rpm)
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3781 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3782 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3783 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3784 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_compile)
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3785 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3786 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3787 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3788 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3789 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3790 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_install)
NOTE: recipe enchant2-2.3.0-r0: task do_install: Started
NOTE: recipe enchant2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 3791 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package)
NOTE: Running task 3792 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_populate_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_package: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 3793 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_packagedata)
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3794 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3795 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_compile)
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Started
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3796 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3797 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3798 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3799 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3800 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3801 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: Running task 3802 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3803 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3804 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3805 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3806 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3807 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3808 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3809 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3810 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3811 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3812 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package)
NOTE: Running task 3813 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3814 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3815 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3816 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3817 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3818 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3819 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3824 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_configure)
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3825 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3829 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Succeeded
NOTE: Running task 3830 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_compile)
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Succeeded
NOTE: Running task 3831 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_install)
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Succeeded
NOTE: Running task 3832 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package)
NOTE: Running task 3833 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Succeeded
NOTE: Running task 3834 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_packagedata)
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3835 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_write_rpm)
NOTE: Running task 3836 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_qa)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3837 of 3837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3837 tasks of which 3348 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 34 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============4746556867147746815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1458 entries from dependency cache.
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
DISTRO_VERSION       = "3.3+snapshot-4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 209 Local 12 Network 0 Missed 197 Current 1035 (5% match, 84% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1047 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1053 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1057 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1167 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe iso-codes-4.6.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1191 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1192 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iso-codes-4.6.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1193 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1244 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running task 1196 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1542 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1549 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1550 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1551 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1552 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: Running task 1684 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1693 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: Running task 1745 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1746 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1756 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1757 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: Running task 1758 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1759 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1760 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: Running task 1761 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1762 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1768 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: Running task 1808 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Started
NOTE: Running task 1835 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: Running task 1852 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: Running task 1865 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_unpack)
NOTE: Running task 1873 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1889 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1985 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: Running task 1995 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: Running task 1996 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: Running task 2057 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: Running task 2080 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2087 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: Running task 2121 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 2150 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2151 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_fetch)
NOTE: Running task 2157 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: Running task 2167 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2182 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2198 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: Running task 2199 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_fetch)
NOTE: Running task 2200 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_fetch)
NOTE: Running task 2206 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2207 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2211 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_fetch)
NOTE: Running task 2213 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 2241 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_fetch)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: Running task 2251 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: Running task 2260 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2263 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 2267 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 2268 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: Running task 2271 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2272 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_fetch)
NOTE: Running task 2273 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_fetch)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 2290 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: Running task 2291 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Started
NOTE: Running task 2292 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2293 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2317 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: Running task 2318 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_unpack)
NOTE: Running task 2319 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 2330 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2344 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 2345 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2346 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: Running task 2348 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_unpack)
NOTE: Running task 2365 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: Running task 2368 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_unpack)
NOTE: Running task 2369 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2370 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2371 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_unpack)
NOTE: Running task 2374 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe vala-0.52.4-r0: task do_fetch: Started
NOTE: Running task 2375 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-236-r0: task do_fetch: Started
NOTE: recipe vala-0.52.4-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 2382 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_unpack)
NOTE: recipe libgudev-236-r0: task do_fetch: Succeeded
NOTE: Running task 2383 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Started
NOTE: Running task 2389 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: Running task 2390 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: Running task 2392 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2394 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: Running task 2395 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2396 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_fetch)
NOTE: Running task 2397 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 2398 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_fetch)
NOTE: Running task 2399 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: Running task 2400 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: Running task 2401 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_fetch)
NOTE: Running task 2402 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_fetch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2439 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Started
NOTE: Running task 2444 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: Running task 2445 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_patch)
NOTE: Running task 2446 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: Running task 2447 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 2456 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Started
NOTE: Running task 2457 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: Running task 2458 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_write_config)
NOTE: Running task 2459 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Started
NOTE: Running task 2460 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2461 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: Running task 2469 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2470 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_patch)
NOTE: Running task 2471 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libgudev-236-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Started
NOTE: Running task 2474 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_patch)
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2477 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 2492 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 2505 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: Running task 2517 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: Running task 2518 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2519 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_unpack)
NOTE: Running task 2520 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: Running task 2521 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_unpack)
NOTE: Running task 2522 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2523 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_patch)
NOTE: Running task 2524 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2525 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2526 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_patch)
NOTE: Running task 2527 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Started
NOTE: recipe libgudev-236-r0: task do_unpack: Succeeded
NOTE: Running task 2528 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 2529 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2530 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_patch)
NOTE: Running task 2531 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Started
NOTE: Running task 2532 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2533 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2534 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2541 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_fetch)
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Started
NOTE: Running task 2544 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2548 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_write_config)
NOTE: Running task 2550 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_generate_toolchain_file)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: Running task 2551 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2557 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2558 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Started
NOTE: Running task 2559 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 2560 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2561 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: Running task 2562 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_write_config)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2571 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2572 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Started
NOTE: recipe iso-codes-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2580 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libgudev-236-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Succeeded
NOTE: Running task 2605 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_patch)
NOTE: Running task 2606 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2608 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Started
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2621 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2622 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2623 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: Running task 2624 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2637 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Succeeded
NOTE: Running task 2638 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2648 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2649 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgudev-236-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2650 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2651 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2652 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2653 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_patch)
NOTE: Running task 2654 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Succeeded
NOTE: Running task 2655 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 2656 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2657 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2658 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-236-r0: task do_write_config: Succeeded
NOTE: Running task 2666 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: recipe libgudev-236-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Started
NOTE: Running task 2670 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2678 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.52.4-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 2694 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2695 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_patch)
NOTE: Running task 2697 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2705 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2706 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2707 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2708 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2709 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 2710 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2711 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2712 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2713 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2714 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2715 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Started
NOTE: Running task 2716 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2717 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: Running task 2718 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_patch: Started
NOTE: Running task 2719 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 2720 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2721 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_write_config)
NOTE: Running task 2722 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: Running task 2723 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Succeeded
NOTE: Running task 2724 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_write_config)
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2733 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2745 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 2746 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: Running task 2769 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: Running task 2770 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_patch: Succeeded
NOTE: Running task 2771 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 2772 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2773 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 2774 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2775 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2777 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Started
NOTE: Running task 2783 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2788 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2834 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2913 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2926 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2927 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_configure)
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Succeeded
NOTE: Running task 2983 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_compile)
NOTE: Running task 2990 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3003 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dabf505693ad0159cbe77fbdafa5f556db7151d2c6d49eedb0615e89417b5252
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3041 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3046 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Started
NOTE: Running task 3047 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3057 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Succeeded
NOTE: Running task 3065 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3068 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3069 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3072 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_install)
NOTE: Running task 3075 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_patch)
NOTE: Running task 3077 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3079 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3080 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3081 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 3085 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3086 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Succeeded
NOTE: Running task 3524 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3525 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 73d88f4e8b858d1118c121c8b4f8d71ef1c1f032f356d1be99797c697f234ee2
NOTE: Setscene tasks completed
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Started
NOTE: Running task 3574 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: Running task 3575 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3590 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3591 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 3592 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: Running task 3593 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3594 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure)
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3595 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Started
NOTE: Running task 3596 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3597 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3598 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure)
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: Running task 3599 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: Running task 3600 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 3601 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3602 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3603 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3604 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_configure)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 3605 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_configure: Started
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_install: Started
NOTE: Running task 3606 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_patch)
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 3607 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 3608 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package)
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 3609 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3610 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Succeeded
NOTE: Running task 3611 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure_ptest_base)
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3612 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Succeeded
NOTE: Running task 3613 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_generate_toolchain_file)
NOTE: Running task 3614 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3615 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic)
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3616 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 3617 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile)
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3618 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic unihash changed to 8d61fad4acdf68670fe6ed7b59f61ec3fac19d58ee10e0ac9ed6542b8a7ccc4b
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: Running task 3619 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_compile)
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-236-r0: task do_configure: Succeeded
NOTE: Running task 3620 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Started
NOTE: Running task 3621 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3622 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 3623 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 3624 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3625 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3626 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3627 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Succeeded
NOTE: Running task 3628 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile_ptest_base)
NOTE: recipe libwpe-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 3629 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_packagedata)
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3630 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install)
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 3631 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3632 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: Running task 3633 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3634 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3635 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3636 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: Running task 3637 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3638 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-236-r0: task do_compile: Succeeded
NOTE: Running task 3639 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_install)
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-236-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3640 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_install: Succeeded
NOTE: Running task 3641 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_populate_sysroot)
NOTE: Running task 3642 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Started
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Succeeded
NOTE: recipe libgudev-236-r0: task do_package: Started
NOTE: Running task 3644 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3645 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3646 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Succeeded
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3647 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure_ptest_base)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: Running task 3648 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3649 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3650 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Succeeded
NOTE: Running task 3651 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install_ptest_base)
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3652 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 3653 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Started
NOTE: Running task 3654 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3655 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3656 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-236-r0: task do_package: Succeeded
NOTE: Running task 3657 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_packagedata)
NOTE: recipe libgudev-236-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3658 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3659 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libgudev-236-r0: task do_packagedata: Succeeded
NOTE: Running task 3660 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package_write_rpm)
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3661 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3662 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 3663 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3664 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: Running task 3665 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3666 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3667 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package_write_rpm)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3668 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3669 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3670 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: Running task 3671 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: Running task 3672 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: Running task 3673 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3674 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Succeeded
NOTE: Running task 3675 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: Running task 3676 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: Running task 3677 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3678 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3679 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3680 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3681 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: Running task 3682 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3683 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3684 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3685 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3686 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: Running task 3687 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3688 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3689 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 3690 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3691 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: Running task 3692 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3693 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: Running task 3694 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: Running task 3695 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: Running task 3696 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3697 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3698 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package_write_rpm)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3699 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3700 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3701 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3702 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3703 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 3704 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3705 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: Running task 3706 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 3707 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3708 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3709 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3710 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3711 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3712 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3713 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3714 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 3715 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3716 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3717 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3718 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3719 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3720 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3721 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: Running task 3722 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3723 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3724 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: Running task 3725 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: Running task 3726 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3727 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3728 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: Running task 3729 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package)
NOTE: Running task 3730 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3731 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.34-r0: task do_package: Started
NOTE: Running task 3732 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: Running task 3733 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_configure: Succeeded
NOTE: Running task 3734 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3735 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: recipe vala-0.52.4-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 3736 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_compile)
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 3737 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3738 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3739 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3740 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_install)
NOTE: recipe libwebp-1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3741 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3742 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 3743 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: Running task 3744 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 3745 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3746 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3747 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3748 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3749 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package)
NOTE: recipe libxslt-1.1.34-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: Running task 3750 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3751 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_package: Started
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3752 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3753 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3754 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install)
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3755 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Started
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3756 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3757 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3758 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3759 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3760 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3761 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3762 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_packagedata)
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 3763 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3764 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3765 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install_ptest_base)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3766 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 3767 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3768 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: Running task 3769 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package)
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3770 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3771 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Succeeded
NOTE: Running task 3772 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package)
NOTE: Running task 3773 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_populate_sysroot)
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3774 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3775 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3776 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Succeeded
NOTE: Running task 3777 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3778 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3779 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 3780 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3781 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3782 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3783 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3784 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 3785 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3786 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3787 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3788 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 3789 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: Running task 3790 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 3791 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3792 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3793 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3794 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package_write_rpm)
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3795 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3796 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3797 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3798 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3799 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3800 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3801 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_compile: Succeeded
NOTE: Running task 3802 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_install)
NOTE: recipe vala-0.52.4-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3803 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3804 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe vala-0.52.4-r0: task do_install: Succeeded
NOTE: Running task 3805 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_populate_sysroot)
NOTE: Running task 3806 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package)
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Started
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3807 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3808 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Succeeded
NOTE: Running task 3809 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_packagedata)
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3810 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package_write_rpm)
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: Running task 3811 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3812 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3813 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 3814 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3815 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3816 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: Running task 3817 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3818 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3819 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3820 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 3821 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: Running task 3822 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3823 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3824 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3825 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3826 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3827 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 3828 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3829 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package_write_rpm)
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3830 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_compile)
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3831 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3832 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_install)
NOTE: recipe enchant2-2.3.0-r0: task do_install: Started
NOTE: recipe enchant2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 3833 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package)
NOTE: Running task 3834 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.3.0-r0: task do_package: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 3835 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_packagedata)
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3836 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3837 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3838 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3839 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3840 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3841 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3842 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: Running task 3843 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3844 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3845 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3846 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3847 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3848 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3849 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3850 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3851 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3852 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3853 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package)
NOTE: Running task 3854 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3855 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3856 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3857 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3858 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3859 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3860 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3865 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_configure)
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3866 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3870 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Succeeded
NOTE: Running task 3871 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_compile)
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Succeeded
NOTE: Running task 3872 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_install)
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Succeeded
NOTE: Running task 3873 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package)
NOTE: Running task 3874 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Succeeded
NOTE: Running task 3875 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_packagedata)
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3876 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_write_rpm)
NOTE: Running task 3877 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_qa)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3878 of 3878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3878 tasks of which 3376 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============4746556867147746815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 52 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 205 Local 8 Network 0 Missed 197 Current 1035 (3% match, 84% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1047 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1199 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running task 1196 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1542 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1549 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1550 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1551 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1552 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: Running task 1682 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1687 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: Running task 1748 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1749 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1755 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: Running task 1775 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1776 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1777 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1778 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1779 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: Running task 1780 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: Running task 1781 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1790 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1817 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Started
NOTE: Running task 1853 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: Running task 1869 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: Running task 1877 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: Running task 1894 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: Running task 1967 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: Running task 2037 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Started
NOTE: Running task 2057 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2061 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: Running task 2087 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 2102 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 2122 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: Running task 2132 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: Running task 2133 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_fetch)
NOTE: Running task 2139 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_fetch)
NOTE: Running task 2149 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2179 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: Running task 2180 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_fetch)
NOTE: Running task 2181 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_fetch)
NOTE: Running task 2187 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2188 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2192 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_fetch)
NOTE: Running task 2194 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 2195 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: Running task 2223 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_fetch)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: Running task 2239 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 2244 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 2248 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 2249 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: Running task 2252 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_fetch)
NOTE: Running task 2254 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2255 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_fetch)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: Running task 2257 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2272 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: Running task 2273 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: Running task 2279 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: Running task 2300 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 2319 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2323 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Started
NOTE: Running task 2324 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_unpack)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 2337 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_unpack)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2338 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: Running task 2339 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2340 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2346 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: Running task 2351 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: Running task 2352 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_unpack)
NOTE: Running task 2353 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_unpack)
NOTE: Running task 2354 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_unpack)
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2358 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_unpack)
NOTE: Running task 2368 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libgudev-236-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: Running task 2370 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_fetch)
NOTE: Running task 2371 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_fetch)
NOTE: Running task 2372 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: Running task 2373 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: Running task 2374 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 2375 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_fetch)
NOTE: Running task 2376 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2377 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_fetch)
NOTE: Running task 2378 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-236-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: Running task 2407 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_unpack)
NOTE: recipe vala-0.52.4-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 2408 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Started
NOTE: Running task 2409 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2410 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_unpack)
NOTE: Running task 2412 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2424 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: Running task 2425 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2434 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: Running task 2435 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 2436 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: Running task 2437 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: Running task 2438 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_write_config)
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Started
NOTE: Running task 2446 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: Running task 2447 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2448 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2449 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_patch)
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: Running task 2450 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: Running task 2451 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: Running task 2453 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-236-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: Running task 2462 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: Running task 2463 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: recipe vala-0.52.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 2469 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2490 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2498 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2499 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_unpack)
NOTE: Running task 2500 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: Running task 2501 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2502 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: Running task 2503 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2504 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_patch)
NOTE: Running task 2505 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: Running task 2506 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_unpack)
NOTE: Running task 2507 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2508 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_unpack)
NOTE: Running task 2509 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2510 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_patch)
NOTE: Running task 2517 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_fetch)
NOTE: Running task 2523 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_write_config)
NOTE: Running task 2524 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Started
NOTE: Running task 2531 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: Running task 2532 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2533 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2534 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_write_config)
NOTE: Running task 2535 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_generate_toolchain_file)
NOTE: recipe libgudev-236-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2538 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 2540 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: Running task 2541 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2545 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2546 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2547 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2548 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: Running task 2549 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Started
NOTE: Running task 2550 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: Running task 2551 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_patch)
NOTE: Running task 2552 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2557 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe iso-codes-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2565 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Setscene tasks completed
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Started
NOTE: Running task 2573 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2579 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: Running task 2605 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe libgudev-236-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: Running task 2625 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-236-r0: task do_patch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2641 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: Running task 2642 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_patch)
NOTE: Running task 2644 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2645 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Started
NOTE: Running task 2652 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-236-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2653 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: Running task 2654 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: Running task 2655 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2675 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_write_config)
NOTE: Running task 2676 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: Running task 2677 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: Running task 2678 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2679 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: Running task 2680 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 2681 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_write_config)
NOTE: Running task 2682 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2683 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2684 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2685 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2686 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: Running task 2687 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2688 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: Running task 2689 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 2690 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2691 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Started
NOTE: Running task 2692 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Started
NOTE: Running task 2693 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2694 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: Running task 2695 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2702 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2703 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_patch)
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: Running task 2713 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2714 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2719 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 2732 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2798 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Succeeded
NOTE: Running task 2808 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe vala-0.52.4-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2809 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2834 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: Running task 2851 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2865 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f65cba28dda80dce1f2749d91bd589828425857f2542302d949145a6c87a2bb
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2900 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2905 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: Running task 2906 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 2907 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2917 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2925 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2928 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2929 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: Running task 2930 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2933 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: Running task 2934 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2935 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 2936 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2937 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_configure)
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2938 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_configure)
NOTE: Running task 2941 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2942 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2943 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_patch)
NOTE: Running task 2945 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: Running task 2947 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: Running task 2948 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Started
NOTE: Running task 2949 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2950 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2951 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Started
NOTE: Running task 2955 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2956 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2957 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_compile)
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3058 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_populate_sysroot)
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Started
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3311 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_install)
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f1e9d25143136ff89df75508547a4b21e157890b8aa17cc5fc7c213b42812a51
NOTE: Setscene tasks completed
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3388 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3425 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Succeeded
NOTE: Running task 3426 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: Running task 3496 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3549 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Succeeded
NOTE: Running task 3570 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3571 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 3572 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3573 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3574 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: Running task 3575 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3576 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3577 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3578 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3579 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3580 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Started
NOTE: recipe libgudev-236-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3581 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3582 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 3583 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_configure: Started
NOTE: Running task 3584 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Succeeded
NOTE: Running task 3585 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_patch)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3586 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Succeeded
NOTE: Running task 3587 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure_ptest_base)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3588 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 3589 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_compile)
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Succeeded
NOTE: Running task 3590 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile)
NOTE: Running task 3591 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_generate_toolchain_file)
NOTE: Running task 3592 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3593 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic)
NOTE: recipe libgudev-236-r0: task do_configure: Succeeded
NOTE: Running task 3594 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_compile)
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgudev-236-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3595 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3596 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 3597 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package_write_rpm)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic unihash changed to 8d61fad4acdf68670fe6ed7b59f61ec3fac19d58ee10e0ac9ed6542b8a7ccc4b
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3598 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 3599 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_install)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Succeeded
NOTE: Running task 3600 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 3601 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 3602 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 3603 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package)
NOTE: recipe libwpe-1.10.1-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3604 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3605 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 3606 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 3607 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Succeeded
NOTE: Running task 3608 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile_ptest_base)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3609 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install)
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3610 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: Running task 3611 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3612 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3613 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe libgudev-236-r0: task do_compile: Succeeded
NOTE: Running task 3614 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_install)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-236-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3615 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 3616 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3617 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3618 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3619 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-236-r0: task do_install: Succeeded
NOTE: Running task 3620 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: Running task 3621 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package)
NOTE: recipe libgudev-236-r0: task do_package: Started
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 3622 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3623 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3624 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: Running task 3625 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package_write_rpm)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3626 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm: Started
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3627 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package_write_rpm)
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3628 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Succeeded
NOTE: Running task 3629 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install_ptest_base)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3630 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3631 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile)
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3632 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3633 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3634 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package)
NOTE: recipe libgudev-236-r0: task do_package: Succeeded
NOTE: Running task 3635 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3636 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3637 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_compile)
NOTE: recipe libgudev-236-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3638 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3639 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-236-r0: task do_packagedata: Succeeded
NOTE: Running task 3640 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3641 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3642 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3644 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3645 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3646 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3647 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 3648 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package)
NOTE: Running task 3649 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Succeeded
NOTE: Running task 3650 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3651 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3652 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3653 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3654 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 3655 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3656 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: Running task 3657 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: Running task 3658 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3659 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3660 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3661 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 3662 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3663 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3664 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Started
NOTE: Running task 3665 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3666 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3667 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 3668 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 3669 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3670 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3671 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: Running task 3672 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: Running task 3673 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3674 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 3675 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 3676 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: Running task 3677 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: Running task 3678 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3679 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3680 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3681 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: Running task 3682 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3683 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3684 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3685 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3686 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3687 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3688 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3689 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3690 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 3691 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3692 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3693 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Succeeded
NOTE: Running task 3694 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3695 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3696 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3697 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 3698 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3699 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3700 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3701 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3702 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3703 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: Running task 3704 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3705 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: Running task 3706 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: Running task 3707 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3708 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3709 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: Running task 3710 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3711 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: Running task 3712 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_configure: Succeeded
NOTE: Running task 3713 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_compile)
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe vala-0.52.4-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 3714 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: Running task 3715 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3716 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 3717 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3718 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3719 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: Running task 3720 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package)
NOTE: Running task 3721 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3722 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: Running task 3723 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 3724 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3725 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3726 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile_ptest_base)
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3727 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 3728 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3729 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Started
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3730 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3731 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: Running task 3732 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3733 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.0-r0: task do_install: Started
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3734 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3735 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Succeeded
NOTE: Running task 3736 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_packagedata)
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3737 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3738 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: Running task 3739 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3740 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package)
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3741 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3742 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3743 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3744 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3745 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3746 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3747 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 3748 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3749 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Started
NOTE: Running task 3750 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3751 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3752 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3753 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 3754 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_install)
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3755 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Started
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3756 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3757 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Succeeded
NOTE: Running task 3758 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package)
NOTE: Running task 3759 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Succeeded
NOTE: Running task 3760 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 3761 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3762 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3763 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3764 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 3765 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3766 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3767 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 3768 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: Running task 3769 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3770 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 3771 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3772 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3773 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3774 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3775 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3776 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3777 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3778 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3779 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3780 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3781 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3782 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3783 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.52.4-r0: task do_compile: Succeeded
NOTE: Running task 3784 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_install)
NOTE: recipe vala-0.52.4-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3785 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3786 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe vala-0.52.4-r0: task do_install: Succeeded
NOTE: Running task 3787 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_populate_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: Running task 3788 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package)
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Started
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3789 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3790 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Succeeded
NOTE: Running task 3791 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_packagedata)
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3792 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package_write_rpm)
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: Running task 3793 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3794 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3795 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 3796 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3797 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3798 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: Running task 3799 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3800 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3801 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3802 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 3803 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: Running task 3804 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3805 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3806 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3807 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3808 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 3809 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3810 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3811 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package_write_rpm)
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3812 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_compile)
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3813 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3814 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_install)
NOTE: recipe enchant2-2.3.0-r0: task do_install: Started
NOTE: recipe enchant2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 3815 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package)
NOTE: Running task 3816 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.3.0-r0: task do_package: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 3817 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_packagedata)
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3818 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3819 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3820 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3821 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3822 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3823 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3824 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: Running task 3825 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3826 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3827 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3828 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3829 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3830 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3831 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3832 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3833 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3834 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3835 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package)
NOTE: Running task 3836 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3837 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3838 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3839 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3840 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3841 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3842 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3847 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_configure)
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3848 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3852 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Succeeded
NOTE: Running task 3853 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_compile)
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Succeeded
NOTE: Running task 3854 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_install)
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Succeeded
NOTE: Running task 3855 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package)
NOTE: Running task 3856 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Succeeded
NOTE: Running task 3857 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_packagedata)
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3858 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_write_rpm)
NOTE: Running task 3859 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_qa)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3860 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3860 tasks of which 3358 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============4746556867147746815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.18.5 to libjavascriptcoregtk-4.0.so.18.18.6
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.53.2 to libwebkit2gtk-4.0.so.37.53.3
  /usr/lib/libjavascriptcoregtk-4.0.so.18.18.5 moved to /usr/lib/libjavascriptcoregtk-4.0.so.18.18.6
  /usr/lib/libwebkit2gtk-4.0.so.37.53.2 moved to /usr/lib/libwebkit2gtk-4.0.so.37.53.3

--===============4746556867147746815==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.32.1-2.32.2.patch"

From 1a1fc968b3fa56921dddb8a7cc717a3daef2a110 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 12 Jul 2021 00:15:28 +0000
Subject: [PATCH] webkitgtk: upgrade 2.32.1 -> 2.32.2

---
 .../webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch | 6 +++---
 .../webkit/{webkitgtk_2.32.1.bb => webkitgtk_2.32.2.bb}     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.32.1.bb => webkitgtk_2.32.2.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
index efe286ed6b..21828a7ecf 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
@@ -1,4 +1,4 @@
-From af90ae1f128626e8d57a8bcbc432596bfc2987af Mon Sep 17 00:00:00 2001
+From 1a7becde0e508d7fac488bae6c08c1a4a0ac6b73 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 3 Feb 2020 17:06:27 -0800
 Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
@@ -20,11 +20,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index af6c0fac..f393d741 100644
+index 1f500299..0771af9c 100644
 --- a/Source/cmake/OptionsGTK.cmake
 +++ b/Source/cmake/OptionsGTK.cmake
 @@ -6,6 +6,7 @@ WEBKIT_OPTION_BEGIN()
- SET_PROJECT_VERSION(2 32 1)
+ SET_PROJECT_VERSION(2 32 2)
  
  set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
 +set(THREADS_PREFER_PTHREAD_FLAG ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.32.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.32.2.bb
index 7abf96c252..96b6cab49c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch \
            "
 
-SRC_URI[sha256sum] = "136117317f70f66486f71b8edf5e46f8776403c5d8a296e914b11a36ef836917"
+SRC_URI[sha256sum] = "1790f86975bdef957ba9a12fc09202de8f55c885ee38467afc50d2bdb7a6c5cd"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.20.1


--===============4746556867147746815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 67 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 205 Local 8 Network 0 Missed 197 Current 1035 (3% match, 84% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1047 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: Running task 1196 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.34.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1199 of 1240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running task 1542 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1549 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 1550 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1551 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1552 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: Running task 1682 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1687 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: Running task 1748 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1749 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1755 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1793 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1794 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1795 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1796 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1797 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1798 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: Running task 1799 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1800 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 1806 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1818 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: Running task 1854 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_write_config)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 1863 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_unpack)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: Running task 1872 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: Running task 1967 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Started
NOTE: Running task 2037 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2050 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: Running task 2059 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: Running task 2060 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: Running task 2063 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2104 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 2132 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: Running task 2133 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_fetch)
NOTE: Running task 2139 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 2149 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 2150 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2180 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_fetch)
NOTE: Running task 2181 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_fetch)
NOTE: Running task 2182 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: Running task 2188 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 2189 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 2193 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: Running task 2195 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: Running task 2223 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_fetch)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2243 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 2244 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2248 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 2251 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_fetch)
NOTE: Running task 2252 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2254 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_fetch)
NOTE: Running task 2270 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Started
NOTE: Running task 2271 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 2272 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Started
NOTE: Running task 2273 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: Running task 2283 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: Running task 2316 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_unpack)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Started
NOTE: Running task 2321 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2325 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2328 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2329 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2331 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_unpack)
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe vala-0.52.4-r0: task do_fetch: Started
NOTE: Running task 2344 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: Running task 2345 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2350 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe libgudev-236-r0: task do_fetch: Started
NOTE: Running task 2363 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_unpack)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_fetch: Succeeded
NOTE: Running task 2364 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2366 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2367 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_unpack)
NOTE: Running task 2368 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_fetch)
NOTE: Running task 2369 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 2370 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: Running task 2371 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: Running task 2372 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2373 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: Running task 2374 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_fetch)
NOTE: Running task 2375 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_fetch)
NOTE: Running task 2376 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_fetch)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2381 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: recipe libgudev-236-r0: task do_fetch: Succeeded
NOTE: Running task 2403 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_unpack)
NOTE: Running task 2404 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_unpack)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: Running task 2428 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_write_config)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: Running task 2429 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: Running task 2430 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: Running task 2431 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_unpack)
NOTE: Running task 2432 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2433 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_unpack)
NOTE: Running task 2434 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Started
NOTE: recipe vala-0.52.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 2435 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 2443 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Started
NOTE: Running task 2444 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Started
NOTE: recipe libgudev-236-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: Running task 2461 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Started
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 2475 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: Running task 2488 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_unpack)
NOTE: Running task 2489 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 2490 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: Running task 2491 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: Running task 2492 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2493 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: Running task 2494 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2495 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: Running task 2496 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_unpack)
NOTE: Running task 2497 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_unpack)
NOTE: Running task 2498 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 2501 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: Running task 2502 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: Running task 2507 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_fetch)
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2513 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2514 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_patch)
NOTE: Running task 2521 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2522 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 2525 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Started
NOTE: recipe libgudev-236-r0: task do_write_config: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2543 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2549 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2550 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-236-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: Running task 2556 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_patch)
NOTE: Running task 2557 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-236-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: Running task 2633 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 2634 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2643 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_write_config)
NOTE: Running task 2644 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Succeeded
NOTE: Running task 2645 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Succeeded
NOTE: Running task 2646 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe libgudev-236-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: Running task 2647 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Started
NOTE: Running task 2648 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: Running task 2649 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_patch)
NOTE: Running task 2650 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2651 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 2652 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2653 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 2654 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2655 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_write_config)
NOTE: Running task 2656 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2657 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: Running task 2658 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_patch)
NOTE: Running task 2659 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: Running task 2660 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2661 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2662 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: Running task 2663 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2664 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: Running task 2665 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Started
NOTE: Running task 2666 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Started
NOTE: Running task 2667 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Started
NOTE: Running task 2671 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: Running task 2755 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2766 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 2774 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libgudev-236-r0: task do_patch: Succeeded
NOTE: Running task 2795 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2803 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: Running task 2844 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: recipe vala-0.52.4-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Succeeded
NOTE: Running task 2880 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_patch)
NOTE: Running task 2887 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2923 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_populate_sysroot)
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 2927 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2933 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2965 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2966 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: recipe vala-0.52.4-r0: task do_patch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 3047 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 3153 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3180 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 3185 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3195 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 3201 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 3226 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.52.4-r0: task do_patch: Succeeded
NOTE: Running task 3327 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 3354 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: Running task 3355 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: Running task 3356 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3357 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3358 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3359 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3360 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3361 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3362 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3363 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: Running task 3364 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3365 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Started
NOTE: Running task 3366 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3367 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3368 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 3369 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3370 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: Running task 3371 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_generate_toolchain_file)
NOTE: Running task 3372 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3373 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Started
NOTE: Running task 3374 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 3375 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 3376 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3377 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3378 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3379 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: Running task 3380 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 3381 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_patch)
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3382 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3383 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: Running task 3384 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Succeeded
NOTE: Running task 3385 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: Running task 3386 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Succeeded
NOTE: Running task 3387 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3388 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3389 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3390 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Succeeded
NOTE: Running task 3391 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c1c52421c558a99d97195d8181d7a47dd8c9fee192eda9baa2db4e82002169fa
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Succeeded
NOTE: Running task 3420 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3425 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe iso-codes-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3426 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3437 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 3444 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3447 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3450 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: Running task 3451 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_install)
NOTE: Running task 3455 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3457 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Started
NOTE: Running task 3458 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_patch)
NOTE: Running task 3459 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Started
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Succeeded
NOTE: Running task 3505 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: Running task 3506 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Succeeded
NOTE: Running task 3507 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3508 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 3509 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Succeeded
NOTE: Running task 3510 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_patch)
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3511 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3512 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3513 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_configure)
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Succeeded
NOTE: Running task 3514 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_generate_toolchain_file)
NOTE: Running task 3515 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3516 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic)
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3517 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3518 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_configure)
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Started
NOTE: Running task 3519 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 28ff717d10eeb38c6dd88776fdf8d650da378f92a7dd91f56cc79b1cc5c8dd0f
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 3567 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic unihash changed to 8d61fad4acdf68670fe6ed7b59f61ec3fac19d58ee10e0ac9ed6542b8a7ccc4b
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3583 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3584 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure)
NOTE: Running task 3585 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: Running task 3586 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: Running task 3587 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libgudev-236-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3588 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3589 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Succeeded
NOTE: Running task 3590 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 3591 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3592 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3593 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Started
NOTE: recipe libgudev-236-r0: task do_configure: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3594 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: Running task 3595 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libgudev-236-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3596 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 3597 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Succeeded
NOTE: Running task 3598 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_compile)
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Succeeded
NOTE: Running task 3599 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile_ptest_base)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3600 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 3601 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3602 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 3603 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe libwpe-1.10.1-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 3604 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 3605 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package)
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3606 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3607 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 3608 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 3609 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: Running task 3610 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: Running task 3611 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3612 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-236-r0: task do_compile: Succeeded
NOTE: Running task 3613 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3614 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 3615 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Succeeded
NOTE: Running task 3616 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install_ptest_base)
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3617 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3618 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_install: Succeeded
NOTE: Running task 3619 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_populate_sysroot)
NOTE: Running task 3620 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package)
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: Running task 3621 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3622 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-236-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3623 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3624 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3625 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3626 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Succeeded
NOTE: Running task 3627 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3628 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3629 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: Running task 3630 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package_write_rpm)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Succeeded
NOTE: Running task 3631 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3632 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3633 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3634 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3635 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3636 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3637 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3638 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3639 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 3640 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_packagedata)
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3641 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3642 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3643 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-236-r0: task do_package: Succeeded
NOTE: Running task 3644 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3645 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libgudev-236-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3646 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3647 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3648 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3649 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3650 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_install)
NOTE: Running task 3651 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 3652 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3653 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Started
NOTE: Running task 3654 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_packagedata: Succeeded
NOTE: Running task 3655 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3656 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 3657 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3658 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: Running task 3659 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Succeeded
NOTE: Running task 3660 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 3661 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: Running task 3662 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: Running task 3663 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package)
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3664 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: Running task 3665 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3666 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3667 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 3668 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3669 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3670 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3671 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 3672 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: Running task 3673 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 3674 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3675 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: Running task 3676 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3677 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3678 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package_write_rpm)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3679 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3680 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3681 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3682 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3683 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3684 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 3685 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3686 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3687 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3688 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3689 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3690 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3691 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3692 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3693 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 3694 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 3695 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3696 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3697 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package_write_rpm)
NOTE: Running task 3698 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 3699 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3700 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3701 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3702 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3703 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 3704 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3705 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3706 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3707 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3708 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3709 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: Running task 3710 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3711 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: Running task 3712 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3713 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: Running task 3714 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: Running task 3715 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 3716 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe vala-0.52.4-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3717 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_compile)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_compile: Started
NOTE: Running task 3718 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3719 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: Running task 3720 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package)
NOTE: Running task 3721 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3722 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3723 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: Running task 3724 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3725 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3726 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile_ptest_base)
NOTE: recipe libwebp-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3727 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Started
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3728 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_configure)
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3729 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3730 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3731 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: Running task 3732 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: Running task 3733 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: Running task 3734 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3735 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3736 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3737 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3738 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_package: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Succeeded
NOTE: Running task 3739 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_packagedata)
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 3740 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 3741 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3742 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package_write_rpm)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3743 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3744 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Succeeded
NOTE: Running task 3745 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package)
NOTE: Running task 3746 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3747 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3748 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install_ptest_base)
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3749 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3750 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3751 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package)
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3752 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_packagedata)
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Succeeded
NOTE: Running task 3753 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3754 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3755 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3756 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3757 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3758 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3759 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3760 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3761 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 3762 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3763 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3764 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3765 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3766 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3767 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3768 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 3769 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3770 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3771 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 3772 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: Running task 3773 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3774 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3775 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3776 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3777 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 3778 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3779 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package_write_rpm)
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3780 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3781 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3782 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3783 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3784 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3785 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_compile: Succeeded
NOTE: Running task 3786 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_install)
NOTE: recipe vala-0.52.4-r0: task do_install: Started
NOTE: recipe vala-0.52.4-r0: task do_install: Succeeded
NOTE: Running task 3787 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_populate_sysroot)
NOTE: Running task 3788 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package)
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Started
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3789 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3790 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_package: Succeeded
NOTE: Running task 3791 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_packagedata)
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3792 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package_write_rpm)
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3793 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3794 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: Running task 3795 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3796 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3797 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: Running task 3798 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3799 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3800 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3801 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3802 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3803 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3804 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3805 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3806 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 3807 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3808 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 3809 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: Running task 3810 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3811 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Started
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3812 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_install)
NOTE: recipe enchant2-2.3.0-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 3813 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 3814 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package)
NOTE: Running task 3815 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.3.0-r0: task do_package: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3816 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package_write_rpm)
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe enchant2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 3817 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_packagedata)
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3818 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3819 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3820 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3821 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3822 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3823 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3824 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: Running task 3825 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3826 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3827 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3828 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3829 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3830 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3831 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3832 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3833 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3834 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3835 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package)
NOTE: Running task 3836 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3837 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3838 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3839 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3840 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3841 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3842 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3847 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_configure)
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3848 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3852 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Succeeded
NOTE: Running task 3853 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_compile)
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Succeeded
NOTE: Running task 3854 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_install)
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Succeeded
NOTE: Running task 3855 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package)
NOTE: Running task 3856 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Succeeded
NOTE: Running task 3857 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_packagedata)
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3858 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_write_rpm)
NOTE: Running task 3859 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_qa)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3860 of 3860 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3860 tasks of which 3358 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============4746556867147746815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 43 skipped, 0 masked, 0 errors.
Removing 176 recipes from the core2-32 sysroot...done.
Removing 180 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d644c9b9aecada105c20c1f441ea2cd85ef4c6e"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 897 Local 699 Network 0 Missed 198 Current 358 (77% match, 84% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 359 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 381 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 386 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 388 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 390 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 391 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 392 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 395 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 396 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 397 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 398 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 399 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 402 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 404 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 405 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 406 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 407 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 408 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 409 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 411 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 412 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 413 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 414 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 415 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 416 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 418 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 419 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 420 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 421 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 422 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 423 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 424 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 425 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 426 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 427 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 428 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 429 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 430 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 432 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 433 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 434 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 435 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 436 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 437 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 440 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 441 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 447 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 448 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.107.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 449 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 450 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 453 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 454 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 459 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 460 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 462 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 463 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 464 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.107-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 465 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 466 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 467 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 468 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 471 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 472 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 473 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 474 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 476 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 477 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 478 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 479 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 480 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 482 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 484 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 485 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 486 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 487 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 488 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 489 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 490 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 491 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 492 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 493 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 494 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 495 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 496 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 500 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 501 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 502 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 504 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 505 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.107-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 576 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 617 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 621 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 632 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 642 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 643 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 646 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 662 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 663 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 664 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 668 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 674 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 675 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 677 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 678 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 679 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 682 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 683 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 684 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 686 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 688 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 701 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 712 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 713 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 719 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 721 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 722 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 724 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 726 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 727 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pygobject-3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 729 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 732 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 739 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.59-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 744 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 771 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 774 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running task 829 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 830 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_fetch)
NOTE: Running task 831 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 832 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 833 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 890 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 898 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_fetch)
NOTE: Running task 912 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 913 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 916 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 779 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 780 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 781 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 951 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 966 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_write_config)
NOTE: Running task 971 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: Running setscene task 782 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 996 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1003 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Started
NOTE: Running task 1011 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1029 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1038 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Started
NOTE: Running task 1045 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_unpack)
NOTE: Running task 1049 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: Running task 1059 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: Running task 1068 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1069 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_fetch)
NOTE: Running task 1070 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: Running task 1073 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1074 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running setscene task 786 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 787 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: Running setscene task 789 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1076 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_unpack)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 1090 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: Running task 1091 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: Running task 1092 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1093 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_fetch)
NOTE: Running task 1094 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_fetch)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 1095 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: Running task 1096 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 1097 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 1100 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1101 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 793 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 794 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running task 1102 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_unpack)
NOTE: Running task 1105 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_unpack)
NOTE: Running task 1106 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_fetch)
NOTE: Running task 1107 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 1129 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_fetch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1131 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1135 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1136 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1139 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 1142 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_fetch)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: Running task 1143 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1144 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_patch)
NOTE: recipe vala-0.52.4-r0: task do_fetch: Started
NOTE: recipe libgudev-236-r0: task do_fetch: Started
NOTE: recipe vala-0.52.4-r0: task do_fetch: Succeeded
NOTE: Running task 1145 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: recipe libgudev-236-r0: task do_fetch: Succeeded
NOTE: Running task 1146 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 1147 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Started
NOTE: Running setscene task 795 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Started
NOTE: Running setscene task 797 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: Running task 1149 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 1153 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_unpack)
NOTE: Running task 1160 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_fetch: Succeeded
NOTE: Running task 1161 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1163 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1164 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1165 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1167 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 1190 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1209 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running setscene task 802 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Started
NOTE: Running setscene task 805 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_patch)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1211 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_patch)
NOTE: Running task 1212 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1220 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_write_config)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1221 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: Running task 1222 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 812 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_unpack: Succeeded
NOTE: Running task 1229 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Started
NOTE: Running task 1234 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_patch)
NOTE: Running task 1236 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 818 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 819 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 820 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1238 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libgudev-236-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe libical-3.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1251 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: Running task 1252 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 1253 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: recipe vala-0.52.4-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 823 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 824 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: Running task 1266 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_fetch)
NOTE: Running task 1267 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_fetch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1268 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_fetch)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 830 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 832 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 833 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running task 1277 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_fetch)
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1282 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1284 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: recipe enchant2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1285 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_unpack)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 1311 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_write_config)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1314 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe gawk-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1315 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_unpack)
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1354 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: Running setscene task 839 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1355 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1356 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_unpack: Started
NOTE: Running task 1357 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 1362 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_unpack)
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: Running task 1363 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_unpack)
NOTE: Running task 1364 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: Running task 1365 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 845 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1366 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_unpack)
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Started
NOTE: Running task 1367 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1368 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Started
NOTE: Running setscene task 848 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 849 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1369 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1370 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1371 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_patch: Succeeded
NOTE: Running task 1372 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1374 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1375 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1382 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_patch)
NOTE: Running task 1383 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_fetch)
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1384 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1386 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1387 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 1391 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_write_config)
NOTE: recipe libtasn1-4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_patch)
NOTE: Running task 1393 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1398 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_write_config)
NOTE: recipe libgudev-236-r0: task do_unpack: Succeeded
NOTE: Running task 1399 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1400 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_patch)
NOTE: recipe enchant2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1401 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_patch)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_unpack: Succeeded
NOTE: Running task 1403 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_generate_toolchain_file)
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 1404 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_patch)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_generate_toolchain_file)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1407 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Started
NOTE: Running task 1408 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_patch)
NOTE: Running task 1409 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_generate_toolchain_file)
NOTE: Running task 1410 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-236-r0: task do_write_config: Started
NOTE: Running task 1411 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.68.1-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-236-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1412 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Started
NOTE: Running task 1413 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1414 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe webkitgtk-2.32.2-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1415 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1416 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-236-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1426 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 856 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 1446 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_patch: Succeeded
NOTE: Running task 1471 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.10.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1484 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 1485 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1486 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: Running task 1487 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_write_config)
NOTE: Running task 1488 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1489 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_write_config)
NOTE: Running task 1490 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: Running task 1491 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1493 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1500 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: Running task 1536 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: Running task 1537 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 1538 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Started
NOTE: Running setscene task 857 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata_setscene)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Started
NOTE: Running task 1570 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 860 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libgudev-236-r0: task do_patch: Succeeded
NOTE: Running task 1628 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 1648 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1715 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 869 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 870 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1863 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1865 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: Running setscene task 872 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: Running task 1866 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1868 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_unpack: Succeeded
NOTE: Running task 1872 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_patch)
NOTE: Running task 1873 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_unpack: Succeeded
NOTE: Running task 1874 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_patch)
NOTE: Running task 1875 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1876 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_patch)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 1877 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 877 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 878 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Started
NOTE: recipe vala-0.52.4-r0: task do_patch: Started
NOTE: Running setscene task 879 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running task 1878 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1901 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_patch: Succeeded
NOTE: Running task 1911 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_unpack: Succeeded
NOTE: Running task 1912 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 1913 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1914 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 890 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe vala-0.52.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_patch: Succeeded
NOTE: Running task 1919 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1920 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1921 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_patch: Succeeded
NOTE: Running task 1926 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1931 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.107.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.107.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 905 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.107-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.107-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 919 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 928 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.107-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.107-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 930 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.107.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 931 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_unpack: Succeeded
NOTE: Running task 1951 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_patch)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 935 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 936 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.107-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 938 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 941 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 942 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.107-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 948 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 950 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 954 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 959 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 969 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.29-r0: task do_patch: Succeeded
NOTE: Running task 1988 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 982 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 986 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 988 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 990 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-7.77.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 997 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.32.2-r0: task do_unpack: Succeeded
NOTE: Running task 2029 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1004 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1006 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1010 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1015 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1016 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2062 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_generate_toolchain_file)
NOTE: Running task 2067 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2068 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1022 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1024 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1025 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1026 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_lic unihash changed to 8d61fad4acdf68670fe6ed7b59f61ec3fac19d58ee10e0ac9ed6542b8a7ccc4b
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1029 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1030 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1032 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1033 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1039 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1041 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1042 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1048 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1053 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 1054 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1055 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1058 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1062 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 1064 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1067 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1068 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1069 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1071 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1072 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1074 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2109 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1080 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 1082 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1083 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1084 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1086 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1087 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 1088 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: Running task 2117 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 2118 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1091 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1092 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1095 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1096 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1098 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1101 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1102 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 2159 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1105 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1106 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1107 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1108 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1111 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1113 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1114 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1115 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1116 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1118 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 2162 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1120 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 2175 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 1126 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1127 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1128 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1134 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1136 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1137 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1138 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1139 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1140 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 2180 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1144 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2219 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1146 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1148 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 1149 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1150 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1151 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1152 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 1153 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1161 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1166 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1167 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1168 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1169 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1170 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1171 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1172 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1173 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1174 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1176 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1177 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1178 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1179 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1180 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1181 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1185 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1188 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1189 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1190 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1191 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1192 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1193 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1194 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1195 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1196 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1201 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1202 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1205 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1206 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1207 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1208 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1210 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1211 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1212 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1214 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1216 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1217 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1218 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1220 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1221 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1223 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1224 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running setscene task 1225 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1226 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2296 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1228 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ca17797dcb58838ff90c4eb78986bc0e3463a242f2c6801bddee43de51bfe2c9
NOTE: Running task 2305 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1231 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1233 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1234 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1235 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1237 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1239 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1243 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1244 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1245 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1248 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1249 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1250 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1253 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1254 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1255 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2632 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2836 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2837 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2854 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2982 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3021 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3030 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3043 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3051 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3074 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3079 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3080 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3084 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3098 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3100 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3141 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3142 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3143 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 90d527c965ea68cb21fb129de4b81bdaefc2f7e60a656fb921a1df77119a739f
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3206 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3207 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe gawk-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3208 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3213 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3216 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3228 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3234 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_configure)
NOTE: Running task 3239 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3240 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3243 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe gawk-5.1.0-r0: task do_configure: Started
NOTE: Running task 3244 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3245 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3248 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3249 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_configure)
NOTE: Running task 3250 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_configure)
NOTE: Running task 3253 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: Running task 3255 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libwpe-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 3256 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_configure)
NOTE: Running task 3257 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: Running task 3259 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: Running task 3261 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3262 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: Running task 3263 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 3268 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Started
NOTE: Running task 3269 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_configure)
NOTE: Running task 3270 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Started
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_configure: Succeeded
NOTE: Running task 3404 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3592 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_compile: Succeeded
NOTE: Running task 3593 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3594 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3595 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3596 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_install: Succeeded
NOTE: Running task 3597 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: Running task 3598 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3599 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe glib-networking-2.68.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3600 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Started
NOTE: Running task 3601 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3602 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 3603 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 3604 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3605 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_configure)
NOTE: recipe vala-0.52.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3606 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_configure)
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libgudev-236-r0: task do_configure: Started
NOTE: recipe vala-0.52.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3607 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3608 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 3609 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_install)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 3610 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_configure)
NOTE: Running task 3611 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe libwpe-1.10.1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 3612 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 3613 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package)
NOTE: recipe glib-networking-2.68.1-r0: task do_configure: Succeeded
NOTE: Running task 3614 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_configure_ptest_base)
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3615 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3616 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Started
NOTE: Running task 3617 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libgudev-236-r0: task do_configure: Succeeded
NOTE: Running task 3618 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3619 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3620 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libgudev-236-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 3621 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3622 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_configure: Succeeded
NOTE: Running task 3623 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3624 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Started
NOTE: Running task 3625 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: Running task 3626 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: Running task 3627 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile: Succeeded
NOTE: Running task 3628 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_compile_ptest_base)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3629 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_configure: Succeeded
NOTE: Running task 3630 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 3631 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3632 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_configure)
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 3633 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3634 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3635 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe libwpe-1.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3636 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.10.1.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_install: Succeeded
NOTE: Running task 3637 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_populate_sysroot)
NOTE: Running task 3638 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 3639 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3640 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 3641 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: Running task 3642 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package_write_rpm)
NOTE: recipe libwpe-1.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_install)
NOTE: recipe glib-networking-2.68.1-r0: task do_install: Succeeded
NOTE: Running task 3644 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_install_ptest_base)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3645 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_install: Succeeded
NOTE: Running task 3646 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_populate_sysroot)
NOTE: Running task 3647 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package)
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3648 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_install)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Started
NOTE: recipe libgudev-236-r0: task do_compile: Succeeded
NOTE: Running task 3649 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_install)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3650 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_configure_ptest_base)
NOTE: recipe libgudev-236-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package: Succeeded
NOTE: Running task 3651 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3652 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 3653 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package)
NOTE: Running task 3654 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_compile: Succeeded
NOTE: Running task 3655 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-236-r0: task do_install: Succeeded
NOTE: Running task 3656 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Started
NOTE: Running task 3657 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3658 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3659 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Started
NOTE: recipe libgudev-236-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-236-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package: Succeeded
NOTE: Running task 3660 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3661 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.182.0.bb:do_package_write_rpm)
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-236-r0: task do_package: Succeeded
NOTE: Running task 3662 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_packagedata)
NOTE: recipe glib-networking-2.68.1-r0: task do_package: Succeeded
NOTE: Running task 3663 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_packagedata)
NOTE: recipe libgudev-236-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 3664 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3665 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libgudev-236-r0: task do_packagedata: Succeeded
NOTE: Running task 3666 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_package_write_rpm)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_install: Succeeded
NOTE: Running task 3667 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_populate_sysroot)
NOTE: Running task 3668 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.2.182.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3669 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb:do_package_write_rpm)
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3670 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: Running task 3671 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3672 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3673 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.1.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-236-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 3674 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3675 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3676 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3677 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3678 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3679 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 3680 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3681 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3682 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3683 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: Running task 3684 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3685 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3686 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 3687 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3688 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 3689 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: Running task 3690 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libwebp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3691 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: Running task 3692 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3693 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3694 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 3695 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3696 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: Running task 3697 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3698 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 3699 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: Running task 3700 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 3701 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package: Succeeded
NOTE: Running task 3702 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3703 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3704 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3705 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 3706 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3707 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: Running task 3708 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3709 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3710 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3711 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: Running task 3712 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3713 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: Running task 3714 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3715 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3716 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3717 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3718 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3719 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: Running task 3720 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.40.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3721 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3722 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3723 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 3724 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: Running task 3725 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: Running task 3726 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 3727 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_compile)
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe vala-0.52.4-r0: task do_configure: Succeeded
NOTE: Running task 3728 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_compile)
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Started
NOTE: recipe vala-0.52.4-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 3729 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 3730 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe glib-networking-2.68.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 3731 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: Running task 3732 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: Running task 3737 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package)
NOTE: Running task 3738 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: Running task 3739 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3740 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3741 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3742 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_compile_ptest_base)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3743 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3744 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3745 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3746 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 3747 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3748 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 3749 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: Running task 3750 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot)
NOTE: Running task 3751 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3752 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package_write_rpm)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3753 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Succeeded
NOTE: Running task 3754 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3755 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3756 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3757 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3758 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libwebp-1.2.0-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3759 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package_write_rpm)
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.40.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3760 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_install_ptest_base)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3761 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3762 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe enchant2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3763 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_configure)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3764 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3765 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 3766 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_install)
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3767 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3768 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package)
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.0-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_package: Succeeded
NOTE: Running task 3769 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata)
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 3770 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe libtasn1-4.17.0-r0: task do_install: Succeeded
NOTE: Running task 3771 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package)
NOTE: Running task 3772 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3773 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3774 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3775 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_packagedata)
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3776 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_package: Succeeded
NOTE: Running task 3777 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3778 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_configure_ptest_base)
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3779 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_compile)
NOTE: recipe gawk-5.1.0-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3780 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3781 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.17.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 3782 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3783 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 3784 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 3785 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: Running task 3786 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3787 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3788 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3789 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3790 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3791 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 3792 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3793 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3794 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_install)
NOTE: recipe gawk-5.1.0-r0: task do_install: Started
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
ERROR: harfbuzz-2.8.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:2.8.2-r0 to 0:2.8.1-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3795 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 3796 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.0-r0: task do_install_ptest_base: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3797 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3798 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3799 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 3800 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install: Succeeded
NOTE: Running task 3801 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3802 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3803 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot)
NOTE: Running task 3804 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Started
NOTE: Running task 3805 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_install)
NOTE: recipe gawk-5.1.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_install: Started
NOTE: Running task 3808 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3815 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3816 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3817 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_configure)
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.52.4-r0: task do_install: Succeeded
NOTE: Running task 3818 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_populate_sysroot)
NOTE: Running task 3819 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package)
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Started
NOTE: recipe libnotify-0.7.9-r0: task do_configure: Succeeded
NOTE: Running task 3820 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_compile)
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Started
NOTE: recipe vala-0.52.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3821 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3822 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package: Succeeded
NOTE: Running task 3823 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Started
NOTE: recipe vala-0.52.4-r0: task do_package: Succeeded
NOTE: Running task 3824 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_packagedata)
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.52.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3825 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.52.4.bb:do_package_write_rpm)
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: Running task 3826 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3827 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Started
NOTE: recipe libnotify-0.7.9-r0: task do_compile: Succeeded
NOTE: Running task 3828 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_install)
NOTE: recipe libnotify-0.7.9-r0: task do_install: Started
NOTE: recipe libnotify-0.7.9-r0: task do_install: Succeeded
NOTE: Running task 3829 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package)
NOTE: Running task 3830 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 3831 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe libnotify-0.7.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3832 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe libnotify-0.7.9-r0: task do_package: Succeeded
NOTE: Running task 3833 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_packagedata)
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.7.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3834 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_package_write_rpm)
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 3835 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 3836 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe enchant2-2.3.0-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3837 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_compile)
NOTE: recipe vala-0.52.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3838 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Started
NOTE: Running task 3839 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 3840 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: Running task 3841 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3842 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3843 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3844 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3845 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_install)
NOTE: recipe enchant2-2.3.0-r0: task do_install: Started
NOTE: recipe enchant2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 3846 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package)
NOTE: Running task 3847 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.3.0-r0: task do_package: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 3848 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3849 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3850 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 3851 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_packagedata)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3852 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe gtk+3-3.24.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3853 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_configure)
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Started
NOTE: recipe enchant2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3854 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 3855 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3856 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package_write_rpm)
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3857 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Started
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3858 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3859 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3860 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: Running task 3861 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3862 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3863 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_populate_sysroot)
NOTE: Running task 3864 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3865 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3866 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3867 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_configure: Succeeded
NOTE: Running task 3868 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_compile)
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3869 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3870 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3871 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3872 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3873 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3874 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package)
NOTE: Running task 3875 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package: Succeeded
NOTE: Running task 3876 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3877 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.29-r0: task do_compile: Succeeded
NOTE: Running task 3878 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_install)
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_install: Succeeded
NOTE: Running task 3879 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package)
NOTE: Running task 3880 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3881 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3886 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_configure)
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package: Succeeded
NOTE: Running task 3887 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_packagedata: Succeeded
NOTE: Running task 3891 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_configure: Succeeded
NOTE: Running task 3892 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_compile)
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_compile: Succeeded
NOTE: Running task 3893 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_install)
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_install: Succeeded
NOTE: Running task 3894 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package)
NOTE: Running task 3895 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package: Succeeded
NOTE: Running task 3896 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_packagedata)
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3897 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_write_rpm)
NOTE: Running task 3898 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_package_qa)
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Started
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_qa: Succeeded
NOTE: recipe webkitgtk-2.32.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3899 of 3899 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3899 tasks of which 3373 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 241 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============4746556867147746815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/webkitgtk: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.32.1.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch file://include_xutil.patch file://reduce-memory-overheads.patch file://musl-lower-stack-usage.patch file://0001-MiniBrowser-Fix-reproduciblity.patch file://0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.32.2.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-wor
 k.patch file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch file://include_xutil.patch file://reduce-memory-overheads.patch file://musl-lower-stack-usage.patch file://0001-MiniBrowser-Fix-reproduciblity.patch file://0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch"
packages/core2-32-poky-linux/webkitgtk: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.18.5 to libjavascriptcoregtk-4.0.so.18.18.6
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.53.2 to libwebkit2gtk-4.0.so.37.53.3
  /usr/lib/libjavascriptcoregtk-4.0.so.18.18.5 moved to /usr/lib/libjavascriptcoregtk-4.0.so.18.18.6
  /usr/lib/libwebkit2gtk-4.0.so.37.53.2 moved to /usr/lib/libwebkit2gtk-4.0.so.37.53.3
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 2893022516 to 2893027132 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 141178202 to 141180545 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.32.1 [default] to 2.32.2 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PV changed from "2.32.1" to "2.32.2"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.32.1 [default] to 2.32.2 [default]

--===============4746556867147746815==--
