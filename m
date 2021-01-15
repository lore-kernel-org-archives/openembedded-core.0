Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.720.1610713822581751963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id AB84838C1192
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-examples: upgrading to 1.18.3 SUCCEEDED
Message-ID: <MADEUP.165A67B08A40D67B.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146796
Content-Type: multipart/mixed; boundary="===============2633998693014737417=="

--===============2633998693014737417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-examples* to *1.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-examples-upgrade-1.18.2-1.18.3.patch
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

--===============2633998693014737417==
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
DISTRO_VERSION       = "3.2+snapshot-a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 226 Found 24 Missed 202 Current 1024 (10% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1051 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1052 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1248 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-src went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dbg went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-staticdev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-doc went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-locale went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1760 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1778 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 1784 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: Running task 1938 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1947 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: Running task 1952 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1955 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1956 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1981 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: Running task 2003 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 2004 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 2005 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 2042 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: Running task 2053 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 2054 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 2055 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2060 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: Running task 2080 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2081 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_fetch)
NOTE: Running task 2086 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe ell-0.36-r0: task do_fetch: Started
NOTE: recipe ell-0.36-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2112 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2119 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2120 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2121 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_unpack)
NOTE: Running task 2140 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 2141 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: Running task 2150 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_fetch)
NOTE: Running task 2151 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: Running task 2155 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 2156 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2157 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 2160 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 2166 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: Running task 2167 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: Running task 2168 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2169 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.36-r0: task do_unpack: Started
NOTE: Running task 2192 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2193 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 2212 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: recipe libgudev-234-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: Running task 2225 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2237 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-234-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2238 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: Running task 2239 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_unpack)
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: Running task 2250 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: Running task 2251 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2252 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2264 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_fetch)
NOTE: Running task 2266 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: Running task 2304 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_unpack)
NOTE: Running task 2309 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
NOTE: Running task 2315 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_write_config)
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: Running task 2318 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: Running task 2324 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: Running task 2325 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2326 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2327 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: Running task 2328 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2329 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2330 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: Running task 2331 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: Running task 2376 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: Running task 2380 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: Running task 2390 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-234-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: Running task 2403 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: Running task 2405 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2406 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 2407 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Started
NOTE: Running task 2414 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: Running task 2419 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: Running task 2433 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_fetch)
NOTE: Running task 2434 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: Running task 2447 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2448 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: Running task 2449 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_unpack)
NOTE: Running task 2451 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2467 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: Running task 2468 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: Running task 2469 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: recipe ell-0.36-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2472 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_patch)
NOTE: Running task 2473 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2474 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2475 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2502 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2506 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: Running task 2507 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: Running task 2514 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_patch)
NOTE: Running task 2524 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_write_config)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: Running task 2538 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_fetch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: Running task 2539 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_fetch)
NOTE: Running task 2540 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_fetch)
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Started
NOTE: Running task 2551 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-234-r0: task do_unpack: Succeeded
NOTE: Running task 2576 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_patch)
NOTE: Running task 2577 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_patch)
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Started
NOTE: Running task 2578 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: Running task 2579 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 2580 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_unpack)
NOTE: Running task 2581 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: Running task 2582 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: recipe ell-0.36-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: Running task 2583 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: Running task 2584 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: Running task 2585 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: Running task 2586 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Started
NOTE: Running task 2587 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2588 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2589 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2590 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Started
NOTE: Running task 2591 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2592 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Started
NOTE: Running task 2607 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_fetch)
NOTE: Running task 2608 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2615 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: Running task 2619 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2620 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2621 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-234-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 2632 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2674 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: recipe ell-0.36-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe libgudev-234-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: Running task 2675 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2676 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2677 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_deploy_source_date_epoch)
NOTE: Running task 2678 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: Running task 2679 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: Running task 2680 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 2681 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2682 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2709 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: Running task 2726 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_unpack)
NOTE: Running task 2727 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_unpack)
NOTE: Running task 2728 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_unpack)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: Running task 2754 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2761 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: Running task 2766 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2797 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2805 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: Running task 2806 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: Running task 2811 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_write_config)
NOTE: Running task 2812 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2819 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: Running task 2846 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Started
NOTE: Running task 2847 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_unpack)
NOTE: Running task 2852 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2895 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_write_config)
NOTE: Running task 2896 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_write_config)
NOTE: Running task 2897 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_write_config)
NOTE: Running task 2903 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2904 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: Running task 2905 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2906 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2907 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 2909 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: Running task 2942 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Started
NOTE: Running task 2947 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: Running task 2970 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: Running task 2971 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2984 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2996 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Succeeded
NOTE: Running task 2997 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3064 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3065 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Succeeded
NOTE: Running task 3103 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: Running task 3117 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: Running task 3163 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: Running task 3164 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: Running task 3237 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_patch)
NOTE: Running task 3251 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3268 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3271 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: Running task 3272 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3273 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3274 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_patch)
NOTE: Running task 3275 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 3276 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_patch)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3277 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3278 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Started
NOTE: Running task 3279 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3280 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Started
NOTE: Running task 3281 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3282 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 3283 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3284 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 3285 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3286 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3287 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3288 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: Running task 3289 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3290 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: Running task 3291 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: Running task 3292 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: Running task 3293 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Started
NOTE: Running task 3294 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 3295 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3296 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d4041a4a48affaafca05a5e4c3d93c77aa466a8c7d00d8d9ab20e5262d434f0f
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: Running task 3370 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3394 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 3402 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 3403 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 3404 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3405 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3410 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic unihash changed to 720a6ae0f1d2b5722a9e8c2c66f349479d5020e4d7403987bab5395e0474c023
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3419 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3420 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3421 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3433 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3438 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3444 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3445 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3448 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: Running task 3449 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3452 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: Running task 3458 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3459 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 3460 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3461 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3462 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0f9421dca25c576b826474b0e95dade406781e1c7de20748017962073d574ad4
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3506 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: Running task 3528 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3547 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3548 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_configure)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3549 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe ell-0.36-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3550 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3551 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3552 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3553 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3554 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 3555 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3556 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3557 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: Running task 3558 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 3559 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 3560 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3561 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3562 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: Running task 3563 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3564 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: Running task 3565 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3566 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3567 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 3568 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 3569 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3570 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3571 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3572 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3573 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3574 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3575 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3576 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3577 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: Running task 3578 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: Running task 3579 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3580 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3581 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3582 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_compile)
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 3583 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 3584 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3585 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3586 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 3587 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3588 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3589 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 3590 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3591 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 3592 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 3593 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3594 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3595 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3596 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3597 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3598 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3599 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3600 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3601 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: Running task 3602 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3603 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3604 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3605 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: Running task 3606 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3607 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libgudev-234-r0: task do_configure: Succeeded
NOTE: Running task 3608 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_compile)
NOTE: recipe ell-0.36-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3609 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_compile)
NOTE: Running task 3610 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: Running task 3611 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: Running task 3612 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: Running task 3613 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-234-r0: task do_compile: Started
NOTE: recipe ell-0.36-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3614 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3615 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3616 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3617 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: Running task 3618 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3619 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3620 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3621 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3622 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3623 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3624 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 3625 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe ell-0.36-r0: task do_compile: Succeeded
NOTE: Running task 3626 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3627 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3628 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: Running task 3629 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe ell-0.36-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3630 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe ell-0.36-r0: task do_install: Succeeded
NOTE: Running task 3631 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_populate_sysroot)
NOTE: Running task 3632 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3633 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 3634 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3635 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: Running task 3636 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3637 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 3638 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.36-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3639 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3640 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3641 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_configure)
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3642 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3644 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.1.0-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3645 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe libgudev-234-r0: task do_compile: Succeeded
NOTE: Running task 3646 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe libgudev-234-r0: task do_install: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3647 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: Running task 3648 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3649 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe libwebp-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3650 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3651 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-234-r0: task do_install: Succeeded
NOTE: Running task 3652 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_populate_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_package: Started
NOTE: Running task 3653 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3654 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package)
NOTE: Running task 3655 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-234-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: Running task 3656 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: Running task 3657 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: Running task 3658 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3659 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3660 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: Running task 3661 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: Running task 3662 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 3663 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3664 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 3665 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 3666 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3667 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3668 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3669 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3670 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3671 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe ell-0.36-r0: task do_package: Succeeded
NOTE: Running task 3672 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.36-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3673 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_compile)
NOTE: recipe libgudev-234-r0: task do_package: Succeeded
NOTE: Running task 3674 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Started
NOTE: recipe libgudev-234-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3675 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package_write_rpm)
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-234-r0: task do_packagedata: Succeeded
NOTE: Running task 3676 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3677 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3678 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3679 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3680 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_packagedata)
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 3681 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3682 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: Running task 3683 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3684 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3685 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3686 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3687 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3688 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3689 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3690 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3691 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3692 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3693 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3694 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3695 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3696 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3697 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3698 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3699 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3700 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: Running task 3701 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3702 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3703 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3704 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3705 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3706 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3707 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3708 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3709 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3710 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3711 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3712 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3713 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: Running task 3714 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3715 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3716 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3717 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3718 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3719 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3720 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3721 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3722 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3723 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3724 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: Running task 3725 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3726 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3727 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3728 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3729 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3730 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3731 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: Running task 3732 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3733 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3734 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3735 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3736 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3737 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3738 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3739 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3740 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3741 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3742 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3743 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3744 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3745 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3746 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3747 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_configure)
NOTE: Running task 3748 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3749 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3750 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3751 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3752 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3753 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3754 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_configure)
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3755 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3756 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3757 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3758 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3759 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3760 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3761 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3762 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3763 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3764 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3765 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3766 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3767 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3768 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3769 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3770 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3771 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3772 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3773 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3774 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3775 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3776 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package)
NOTE: Running task 3777 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Succeeded
NOTE: Running task 3778 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: Running task 3779 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: Running task 3780 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3781 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Started
NOTE: Running task 3782 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Succeeded
NOTE: Running task 3783 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_install)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Succeeded
NOTE: Running task 3784 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3785 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3786 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3787 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3788 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3789 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Succeeded
NOTE: Running task 3790 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3791 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package)
NOTE: Running task 3792 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3793 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3794 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3795 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3796 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3797 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3798 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3799 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3800 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3801 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_configure)
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3802 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 3803 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_compile)
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 3804 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_install)
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3805 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 3806 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3807 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3808 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3809 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3810 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3811 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3812 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3813 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3814 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package)
NOTE: Running task 3815 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3816 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3817 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 3818 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3819 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3820 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3821 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3822 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3823 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3824 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3825 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3826 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3827 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3828 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3829 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3830 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3831 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3832 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3833 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 3834 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3835 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3835 tasks of which 3330 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 35 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2633998693014737417==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gst-examples-upgrade-1.18.2-1.18.3.patch"

From 8326106b58af45b403558d2abd5a4526eecdf3bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 10:22:17 +0000
Subject: [PATCH] gst-examples: upgrade 1.18.2 -> 1.18.3

---
 .../{gst-examples_1.18.2.bb => gst-examples_1.18.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.2.bb => gst-examples_1.18.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
index 54a4b5df15..35a8928f51 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "45086d8ef2d75244d9d5c8f69c0f0e1dfd4200b3"
+SRCREV = "06599904baa5d0e47b5cb9501372156567760f8e"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============2633998693014737417==
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
DISTRO_VERSION       = "3.2+snapshot-a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 226 Found 24 Missed 202 Current 1024 (10% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1051 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1052 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1248 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-src went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dbg went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-staticdev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-doc went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-locale went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1742 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1760 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 1766 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: Running task 1920 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: Running task 1929 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1934 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1937 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1938 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_fetch)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: Running task 1963 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1985 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1986 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 1987 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 2011 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 2012 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: Running task 2013 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2014 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 2042 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_fetch)
NOTE: Running task 2062 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2063 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_fetch)
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: Running task 2068 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe ell-0.36-r0: task do_fetch: Started
NOTE: Running task 2127 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe ell-0.36-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2129 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_fetch)
NOTE: Running task 2133 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 2135 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2136 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_unpack)
NOTE: Running task 2137 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 2139 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: Running task 2156 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2157 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2158 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 2170 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2174 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2175 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 2176 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: Running task 2196 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: Running task 2198 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2199 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe libgudev-234-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 2200 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-234-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: Running task 2219 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_unpack)
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2220 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_unpack)
NOTE: Running task 2221 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_unpack)
NOTE: Running task 2222 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: Running task 2227 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2228 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.36-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: Running task 2229 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2230 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2236 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: Running task 2253 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
NOTE: Running task 2254 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: Running task 2256 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_fetch)
NOTE: Running task 2258 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 2283 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2284 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: Running task 2290 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: Running task 2298 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2304 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2310 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_write_config)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2312 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: Running task 2319 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: Running task 2320 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: Running task 2321 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: Running task 2322 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2323 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2324 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2381 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Started
NOTE: recipe libgudev-234-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: Running task 2391 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: Running task 2392 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: Running task 2401 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: recipe ell-0.36-r0: task do_unpack: Succeeded
NOTE: Running task 2402 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_unpack)
NOTE: Running task 2409 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_patch)
NOTE: Running task 2411 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: Running task 2437 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_fetch)
NOTE: Running task 2438 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2440 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 2441 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: Running task 2478 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2479 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2499 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: Running task 2518 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: Running task 2519 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_write_config)
NOTE: Running task 2533 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_fetch)
NOTE: Running task 2534 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_fetch)
NOTE: Running task 2535 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_fetch)
NOTE: Running task 2570 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: Running task 2571 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 2572 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Started
NOTE: recipe ell-0.36-r0: task do_patch: Started
NOTE: Running task 2573 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Started
NOTE: Running task 2574 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: Running task 2575 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2576 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: Running task 2577 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: Running task 2578 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: Running task 2579 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Succeeded
NOTE: Running task 2580 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: Running task 2581 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 2596 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_fetch)
NOTE: Running task 2597 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: Running task 2604 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_unpack)
NOTE: Running task 2608 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2609 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2610 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Started
NOTE: Running task 2615 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libgudev-234-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2616 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2617 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_patch)
NOTE: Running task 2618 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: Running task 2628 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2638 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe ell-0.36-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2639 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_patch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: Running task 2640 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: Running task 2641 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: Running task 2642 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_deploy_source_date_epoch)
NOTE: Running task 2643 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2644 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: Running task 2645 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Started
NOTE: Running task 2679 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: Running task 2680 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 2713 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: Running task 2720 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_unpack)
NOTE: Running task 2721 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2722 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-234-r0: task do_patch: Started
NOTE: Running task 2738 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2749 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2777 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2794 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 2795 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: Running task 2804 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_write_config)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-234-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: Running task 2826 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2827 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_deploy_source_date_epoch)
NOTE: Running task 2828 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: Running task 2829 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: Running task 2851 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: Running task 2857 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Started
NOTE: Running task 2875 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2876 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: Running task 2891 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_write_config)
NOTE: Running task 2892 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_write_config)
NOTE: Running task 2893 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_write_config)
NOTE: Running task 2897 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: Running task 2912 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2913 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 2914 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2915 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: Running task 2916 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 2933 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: Running task 2943 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 2962 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2975 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2976 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2977 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 3012 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3013 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 3014 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 3039 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3040 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: Running task 3047 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_patch)
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 3139 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_patch)
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 3176 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3214 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 3260 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_patch)
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: Running task 3261 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3268 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Started
NOTE: Running task 3269 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 3270 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Started
NOTE: Running task 3271 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3272 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3273 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: Running task 3274 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Started
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: Running task 3275 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_patch)
NOTE: Running task 3276 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 3277 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: Running task 3278 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 3279 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3280 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_patch)
NOTE: Running task 3281 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3282 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3283 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 3284 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3285 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Started
NOTE: Running task 3286 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: Running task 3287 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3288 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3289 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 3290 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 37b13c2fd369d8f1cbb30d7498e8ed15c2aa31eab2163136d11ca50fb4715ab0
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3364 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3388 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3396 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3397 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3398 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3399 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: Running task 3400 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3405 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3414 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: Running task 3415 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3416 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3417 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic unihash changed to 720a6ae0f1d2b5722a9e8c2c66f349479d5020e4d7403987bab5395e0474c023
NOTE: Running task 3418 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3419 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3431 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3441 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3442 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3443 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3446 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: Running task 3447 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3455 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: Running task 3456 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3457 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: Running task 3458 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 3459 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: Running task 3460 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3461 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3462 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2f87c1f8835bea5fb54c2522c9fffb8ea62a07ad29d07add5b6484f22177419
NOTE: Setscene tasks completed
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3506 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: Running task 3528 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3547 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3548 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: recipe ell-0.36-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3549 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3550 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3551 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe libgudev-234-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3552 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3553 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: Running task 3554 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3555 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 3556 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 3557 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3558 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 3559 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 3560 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3561 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 3562 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: Running task 3563 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: Running task 3564 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3565 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 3566 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3567 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3568 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 3569 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3570 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3571 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3572 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3573 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3574 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3575 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3576 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3577 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3578 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3579 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3580 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3581 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3582 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3583 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 3584 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 3585 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3586 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3587 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3588 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3589 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 3590 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 3591 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3592 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 3593 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 3594 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3595 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3596 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3597 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3598 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3599 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3600 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3601 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3602 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3603 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: Running task 3604 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3605 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3606 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: recipe ell-0.36-r0: task do_configure: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: Running task 3607 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3608 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.36-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3609 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3610 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3611 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: Running task 3612 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3613 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: Running task 3614 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3615 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3616 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3617 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3618 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3619 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3620 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe libgudev-234-r0: task do_configure: Succeeded
NOTE: Running task 3621 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3622 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3623 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-234-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 3624 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe ell-0.36-r0: task do_compile: Succeeded
NOTE: Running task 3625 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3626 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3627 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe ell-0.36-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3628 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3629 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: Running task 3630 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe ell-0.36-r0: task do_install: Succeeded
NOTE: Running task 3631 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_populate_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: Running task 3632 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package)
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.36-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3633 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3634 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 3635 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3636 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: Running task 3637 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: Running task 3638 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3639 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3640 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: Running task 3641 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3642 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libwebp-1.1.0-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3643 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3644 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3645 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 3646 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: Running task 3647 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3648 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe libgudev-234-r0: task do_compile: Succeeded
NOTE: Running task 3649 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_install)
NOTE: recipe libwebp-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3650 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libgudev-234-r0: task do_install: Started
NOTE: Running task 3651 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3652 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: Running task 3653 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: Running task 3654 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 3655 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3656 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe libgudev-234-r0: task do_install: Succeeded
NOTE: Running task 3657 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 3658 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: Running task 3659 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package)
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libgudev-234-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: Running task 3660 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: Running task 3661 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: Running task 3662 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 3663 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 3664 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: Running task 3665 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3666 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: Running task 3667 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3668 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.36-r0: task do_package: Succeeded
NOTE: Running task 3669 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3670 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3671 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Succeeded
NOTE: recipe ell-0.36-r0: task do_packagedata: Started
NOTE: Running task 3672 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Started
NOTE: recipe ell-0.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3673 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package_write_rpm)
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3674 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3675 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package: Succeeded
NOTE: recipe libgudev-234-r0: task do_package: Succeeded
NOTE: Running task 3676 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_packagedata)
NOTE: Running task 3677 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_packagedata)
NOTE: recipe libgudev-234-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3678 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3679 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3680 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3681 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3682 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3683 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3684 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3685 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 3686 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe libgudev-234-r0: task do_packagedata: Succeeded
NOTE: Running task 3687 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3688 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3689 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3690 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3691 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3692 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_install)
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3693 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Started
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3694 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3695 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: Running task 3696 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3697 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3698 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3699 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3700 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3701 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3702 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3703 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3704 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3705 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3706 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3707 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3708 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3709 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3710 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3711 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3712 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3713 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3714 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3715 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3716 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3717 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3718 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3719 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3720 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3721 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3722 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3723 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3724 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3725 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3726 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3727 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3728 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3729 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3730 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3731 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3732 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3733 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: Running task 3734 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3735 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3736 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3737 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3738 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3739 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3740 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3741 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3742 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_configure)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3743 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3744 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3745 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3746 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3747 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3748 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3749 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3750 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_configure)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3751 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3752 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3753 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3754 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3755 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3756 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3757 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3758 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3759 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: Running task 3760 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3761 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3762 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3763 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3764 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3765 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3766 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3767 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: Running task 3768 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Succeeded
NOTE: Running task 3769 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_compile)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Succeeded
NOTE: Running task 3770 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3771 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3772 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3773 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3774 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Succeeded
NOTE: Running task 3775 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3776 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3777 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3778 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3779 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3780 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3781 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3782 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3783 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package)
NOTE: Running task 3784 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Succeeded
NOTE: Running task 3785 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3786 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3787 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package_write_rpm)
NOTE: Running task 3788 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3789 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3790 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3791 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3792 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3793 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3794 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3795 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_configure)
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3796 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3797 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 3798 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3799 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 3800 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_install)
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3801 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package)
NOTE: Running task 3802 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3803 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 3804 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3805 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3806 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3807 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3808 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3809 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3810 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3811 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3812 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3813 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3814 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package)
NOTE: Running task 3815 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3816 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3817 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3818 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3819 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3820 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 3821 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3822 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3823 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3824 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3825 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3826 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3827 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3828 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3829 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3830 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3831 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3832 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3833 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 3834 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3835 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3835 tasks of which 3330 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 27 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2633998693014737417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 43 skipped, 0 masked, 0 errors.
Removing 185 recipes from the core2-32 sysroot...done.
Removing 189 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 928 Found 730 Missed 198 Current 329 (78% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 332 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 381 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 386 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 388 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 390 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 391 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 392 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 395 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 396 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 397 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 398 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 399 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 402 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 403 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 404 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 405 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 407 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 408 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 409 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 410 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 411 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm_setscene)
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
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 412 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 413 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 414 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 417 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 418 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 419 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 420 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 421 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 422 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 424 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 425 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 426 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 427 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 428 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 429 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 430 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe orc-0.4.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 432 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 433 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 438 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 439 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe json-glib-1.6.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 440 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 446 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 447 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 448 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 449 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 450 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 451 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 454 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 455 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 456 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 459 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 460 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 463 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 465 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 466 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 467 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe json-glib-1.6.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 472 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 473 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 474 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 475 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 476 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 477 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 478 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 479 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 480 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 481 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 482 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 483 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 485 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 486 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 487 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 488 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 501 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 519 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 542 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 553 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 575 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 576 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 612 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 667 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 673 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 677 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 678 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 680 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 681 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Started
NOTE: recipe json-glib-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe json-glib-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 690 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: Running setscene task 693 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 695 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 696 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 697 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 698 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 699 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 700 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 706 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 707 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 718 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 719 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 736 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 742 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 744 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 745 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 752 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 755 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_package_write_rpm_setscene)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 766 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 776 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 780 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 782 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 788 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 790 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 793 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 798 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 801 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-glib-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 817 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.2.162.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 852 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 860 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 861 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 931 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 934 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 935 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 936 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 937 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_fetch)
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 972 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 973 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 974 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 975 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 991 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_fetch)
NOTE: Running task 1002 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 843 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: Running setscene task 844 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1003 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_fetch)
NOTE: Running task 1006 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: Running task 1040 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: Running task 1041 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_fetch)
NOTE: Running task 1048 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 1051 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: Running task 1067 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: Running task 1081 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: Running task 1113 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_fetch)
NOTE: Running task 1114 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
NOTE: Running task 1129 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_write_config)
NOTE: Running task 1134 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 1135 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: Running task 1136 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 1137 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: Running task 1138 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: Running task 1139 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: Running task 1179 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: Running task 1189 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: Running task 1190 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1191 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1192 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: Running task 1196 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: Running task 1205 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_fetch)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: Running task 1245 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.36-r0: task do_fetch: Started
NOTE: recipe ell-0.36-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_write_config)
NOTE: Running task 1268 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 854 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 859 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1269 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 1270 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 862 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Started
NOTE: Running setscene task 863 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running setscene task 864 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe libgudev-234-r0: task do_fetch: Started
NOTE: recipe libgudev-234-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: Running setscene task 870 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: Running setscene task 871 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: Running setscene task 873 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 877 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Started
NOTE: Running task 1274 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1275 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1276 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: Running task 1277 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 1278 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 1279 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 1280 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Started
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-src went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dbg went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: Running task 1282 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_unpack)
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: Running task 1283 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-staticdev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: Running task 1284 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-doc went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1285 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1287 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-locale went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe nettle-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1288 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_unpack)
NOTE: Running task 1289 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 1290 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: Running task 1291 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 880 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 882 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 884 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 885 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 887 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 888 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1292 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 1294 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: Running task 1295 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 890 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1301 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_unpack)
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 1302 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running task 1303 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe ell-0.36-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libgudev-234-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1304 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running setscene task 892 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: Running task 1309 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe nettle-3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: Running task 1310 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 1311 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 1314 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 1315 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: Running task 1316 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 1317 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1318 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: Running setscene task 894 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1319 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 896 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Started
NOTE: Running setscene task 898 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: Running task 1321 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_patch)
NOTE: Running task 1322 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: Running setscene task 901 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 903 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 905 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 906 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: Running setscene task 910 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 911 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 912 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1333 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 1337 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe ell-0.36-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: Running setscene task 914 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 916 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 917 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 919 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libgudev-234-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 920 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Started
NOTE: Running task 1339 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1346 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1348 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_patch)
NOTE: Running task 1349 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1350 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1351 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1352 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe nettle-3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1361 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 1362 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1363 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1364 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 1365 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: Running task 1366 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: Running task 1367 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 922 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1369 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1370 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1371 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1384 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: Running task 1385 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1386 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: Running task 1387 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: recipe nettle-3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ell-0.36-r0: task do_patch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Started
NOTE: recipe libgudev-234-r0: task do_patch: Started
NOTE: Running task 1392 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: Running task 1395 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: Running setscene task 924 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 925 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 927 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 928 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: Running task 1399 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libgudev-234-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ell-0.36-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: Running setscene task 930 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: Running task 1408 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1409 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1410 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_deploy_source_date_epoch)
NOTE: Running task 1411 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: Running task 1412 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1413 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: Running task 1414 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1415 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1416 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_fetch)
NOTE: Running task 1417 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_fetch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1427 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: Running task 1441 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running setscene task 932 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 934 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 936 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 938 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 940 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 941 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 942 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.18.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Started
NOTE: Running task 1449 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 1450 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1459 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 1460 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 945 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 946 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 948 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1466 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: Running task 1467 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1468 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1469 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1515 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1516 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: Running task 1517 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1518 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1544 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1545 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_unpack)
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1546 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1547 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_patch)
NOTE: Running task 1548 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1565 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 1574 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 950 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1608 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_patch)
NOTE: Running task 1609 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1610 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1611 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1624 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: Running task 1633 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: Running task 1634 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: Running task 1642 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_write_config)
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1688 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 952 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 953 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 954 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1690 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: Running task 1719 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_write_config)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1720 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_write_config)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1721 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_write_config)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1725 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: Running task 1726 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: Running task 1728 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1790 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 965 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 967 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1845 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1862 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1863 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic)
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1868 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: Running task 1874 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: Running task 1875 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Started
NOTE: Running task 1876 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1877 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1878 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1879 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 1880 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1881 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 970 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 972 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 974 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 977 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1893 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic unihash changed to 720a6ae0f1d2b5722a9e8c2c66f349479d5020e4d7403987bab5395e0474c023
NOTE: Running task 1895 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1900 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1901 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 984 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 987 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 988 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 989 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 992 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 994 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1911 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 997 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 998 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1006 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1008 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1010 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1014 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1016 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1018 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1019 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1021 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1029 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1035 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1041 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 1042 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1044 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1045 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1048 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1049 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1055 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1057 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1058 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1059 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1061 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1066 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1067 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 1068 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1071 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1072 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1074 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1075 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1077 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1078 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 1080 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1082 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1083 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2013 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2022 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 2023 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1088 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1092 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1093 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 1095 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1096 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1102 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1104 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1106 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1107 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 1108 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2054 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1111 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 1113 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1114 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1116 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1117 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1120 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1121 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1122 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1123 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1124 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 2066 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1126 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running setscene task 1128 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1130 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1132 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1133 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1134 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 2075 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1136 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1138 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2080 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1140 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1142 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1143 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1144 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1145 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1146 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1148 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 1149 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1150 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1151 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1152 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1153 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1159 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1160 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1163 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1171 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1172 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1173 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1174 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1175 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1177 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1178 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1180 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1181 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1182 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1183 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1184 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2123 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1186 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1187 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1188 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1190 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1191 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1192 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1193 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1194 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1195 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1196 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 1198 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1201 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1203 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1206 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1208 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1210 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1211 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1212 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1213 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1214 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1216 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1218 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1220 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1221 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1222 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1223 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1226 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1227 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1228 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1230 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1231 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1232 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2201 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1235 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1236 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1238 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1239 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8aee874b86bf32f2d6775679a54b0a6b02a3acbb944a6280782ba5b76ec44d91
NOTE: Running task 2205 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1242 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1243 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1244 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1250 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1251 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1252 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1254 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1255 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1258 of 1257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2509 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2807 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2898 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2899 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2900 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2921 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2922 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2957 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2973 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2998 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3035 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3036 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3037 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3038 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3110 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 606c018e80990d3d160802f550d145d7183be4710cf26edb902f108f7c3dc2e0
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3255 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3265 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3294 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 3295 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3296 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 3310 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: Running task 3311 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: Running task 3318 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3319 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Running task 3328 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: Running task 3333 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3335 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3343 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3344 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: Running task 3345 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3346 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Started
NOTE: Running task 3347 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: Running task 3348 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3380 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: Running task 3381 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 3561 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3562 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3563 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3564 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3565 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3566 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe ell-0.36-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3567 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: Running task 3568 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3569 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_configure)
NOTE: Running task 3570 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe libgudev-234-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3571 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 3572 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3573 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3574 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 3575 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: Running task 3576 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 3577 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3578 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 3579 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3580 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3581 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3582 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3583 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 3584 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 3585 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 3586 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3587 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3588 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3589 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3590 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3591 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3592 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3593 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3594 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: Running task 3595 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3596 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3597 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3598 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3599 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3600 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3601 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_compile)
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3602 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 3603 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 3604 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3605 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3606 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 3607 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 3608 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3609 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: Running task 3610 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3611 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3612 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 3613 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: Running task 3614 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3615 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3616 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3617 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3618 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3619 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3620 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3621 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3622 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3623 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3624 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3625 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: Running task 3626 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3627 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3628 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: Running task 3629 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.36-r0: task do_configure: Succeeded
NOTE: Running task 3630 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3631 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3632 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: recipe ell-0.36-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3633 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3634 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3635 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3636 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 3637 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3638 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3639 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3640 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3641 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: Running task 3642 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe ell-0.36-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3644 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3645 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3646 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe ell-0.36-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 3647 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe libgudev-234-r0: task do_configure: Succeeded
NOTE: Running task 3648 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_compile)
NOTE: recipe ell-0.36-r0: task do_install: Succeeded
NOTE: Running task 3649 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_populate_sysroot)
NOTE: Running task 3650 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-234-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3651 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe ell-0.36-r0: task do_package: Started
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3652 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3653 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3654 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3655 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3656 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_install)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 3657 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe libwebp-1.1.0-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3658 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3659 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: Running task 3660 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3661 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3662 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3663 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 3664 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: recipe libwebp-1.1.0-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3665 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3666 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: Running task 3667 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3668 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: Running task 3669 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3670 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3671 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3672 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3673 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3674 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-234-r0: task do_compile: Succeeded
NOTE: Running task 3675 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: Running task 3676 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 3677 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-234-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe libgudev-234-r0: task do_install: Succeeded
NOTE: Running task 3678 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3679 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package)
NOTE: Running task 3680 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: Running task 3681 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-234-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3682 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 3683 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 3684 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3685 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.36-r0: task do_package: Succeeded
NOTE: Running task 3686 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3687 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3688 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe ell-0.36-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3689 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3690 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package_write_rpm)
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3691 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3692 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3693 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libgudev-234-r0: task do_package: Succeeded
NOTE: Running task 3694 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3695 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe libgudev-234-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3696 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_compile)
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3697 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 3698 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Started
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-234-r0: task do_packagedata: Succeeded
NOTE: Running task 3699 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3700 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3701 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3702 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3703 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3704 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: Running task 3705 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3706 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3707 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3708 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3709 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3710 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3711 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3712 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3713 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3714 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: Running task 3715 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3716 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3717 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3718 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3719 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3720 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3721 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3722 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3723 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3724 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3725 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3726 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3727 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3728 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3729 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3730 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3731 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3732 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3733 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3734 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3735 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3736 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3737 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3738 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3739 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3740 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3741 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3742 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3743 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3744 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3745 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: Running task 3746 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3747 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3748 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3749 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3750 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: Running task 3751 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3752 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3753 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3754 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3755 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3756 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3757 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3758 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3759 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3760 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3761 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3762 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3763 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3764 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3765 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3766 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3767 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3768 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3769 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3770 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3771 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3772 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3773 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3774 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3775 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3776 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3777 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3778 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3779 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3780 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3781 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3782 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: Running task 3783 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3784 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3785 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3786 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3787 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3788 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3789 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3790 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package)
NOTE: Running task 3791 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3792 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3793 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3794 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3795 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3796 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3797 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3798 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3799 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3800 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3801 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3802 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3803 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3804 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3805 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package)
NOTE: Running task 3806 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3807 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3808 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3809 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3810 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3811 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3812 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_configure)
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 3813 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_compile)
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3814 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3815 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3816 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3817 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 3818 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_install)
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 3819 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3820 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3821 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3822 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3823 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3824 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3825 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package)
NOTE: Running task 3826 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3827 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3828 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3829 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3830 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 3831 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3832 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3833 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3834 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3835 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3836 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3837 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3838 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3839 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3840 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3841 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3842 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3843 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 3844 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3845 of 3845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3845 tasks of which 3345 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 26 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2633998693014737417==
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
DISTRO_VERSION       = "3.2+snapshot-a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 226 Found 24 Missed 202 Current 1017 (10% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1044 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1045 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1080 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1241 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-src went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dbg went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-staticdev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-doc went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-locale went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1243 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1742 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1760 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 1766 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: Running task 1916 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1924 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1925 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1927 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1932 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1935 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1936 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_fetch)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: Running task 1955 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: Running task 1960 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1982 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1983 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 1984 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1988 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 2030 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_fetch)
NOTE: Running task 2050 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2051 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_fetch)
NOTE: Running task 2056 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.36-r0: task do_fetch: Started
NOTE: Running task 2100 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2101 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2109 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_fetch)
NOTE: Running task 2110 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2115 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 2118 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: recipe ell-0.36-r0: task do_fetch: Succeeded
NOTE: Running task 2146 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: Running task 2147 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2148 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2149 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_unpack)
NOTE: Running task 2150 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2151 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 2152 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2153 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 2176 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: Running task 2190 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Started
NOTE: Running task 2201 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2212 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: Running task 2213 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2214 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_unpack)
NOTE: Running task 2224 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_fetch)
NOTE: Running task 2226 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2273 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_write_config)
NOTE: recipe ell-0.36-r0: task do_unpack: Started
NOTE: Running task 2281 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: Running task 2282 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: Running task 2283 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2284 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2285 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: Running task 2286 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: Running task 2343 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: Running task 2368 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Started
NOTE: Running task 2380 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: Running task 2394 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_fetch)
NOTE: Running task 2451 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: Running task 2470 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_write_config)
NOTE: Running task 2484 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_fetch)
NOTE: Running task 2485 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_fetch)
NOTE: Running task 2486 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_fetch)
NOTE: Running task 2535 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_fetch)
NOTE: Running task 2536 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2546 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2547 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2548 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2718 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_write_config)
NOTE: Running task 2797 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_write_config)
NOTE: Running task 2798 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_write_config)
NOTE: Running task 2799 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: recipe libgudev-234-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: Running task 2800 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-234-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2801 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: Running task 2802 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Started
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 2803 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2804 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_unpack)
NOTE: Running task 2805 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2806 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: Running task 2807 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
NOTE: Running task 2808 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: Running task 2809 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: Running task 2810 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_unpack)
NOTE: Running task 2811 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: Running task 2812 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: Running task 2813 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: Running task 2814 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2815 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2816 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2817 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe libgudev-234-r0: task do_unpack: Started
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2818 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2819 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2820 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2821 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2822 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2823 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 2824 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: Running task 2825 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: Running task 2826 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: Running task 2827 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_unpack)
NOTE: Running task 2828 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Succeeded
NOTE: Running task 2829 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Succeeded
NOTE: Running task 2830 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: Running task 2831 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_unpack)
NOTE: Running task 2832 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_unpack)
NOTE: Running task 2833 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_unpack)
NOTE: Running task 2834 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 2835 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: Running task 2836 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 2837 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_unpack)
NOTE: Running task 2838 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: Running task 2881 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.36-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 2882 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: Running task 2883 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: Running task 2884 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_patch)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2885 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2886 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 2887 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_patch)
NOTE: Running task 2888 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe libgudev-234-r0: task do_unpack: Succeeded
NOTE: Running task 2889 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 2890 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe ell-0.36-r0: task do_patch: Started
NOTE: Running task 2891 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_patch)
NOTE: Running task 2892 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2893 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 2894 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: Running task 2895 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2896 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 2897 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_patch)
NOTE: Running task 2898 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2899 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Started
NOTE: Running task 2900 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: Running task 2901 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe ell-0.36-r0: task do_patch: Succeeded
NOTE: Running task 2902 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: Running task 2903 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2904 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-234-r0: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: Running task 2905 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2906 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_deploy_source_date_epoch)
NOTE: Running task 2907 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 2908 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: Running task 2909 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_patch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2910 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-234-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2911 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: Running task 2912 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: Running task 2913 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_deploy_source_date_epoch)
NOTE: Running task 2914 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2915 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: Running task 2916 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: Running task 2917 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Started
NOTE: Running task 2918 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 2919 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2920 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 2921 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2922 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2923 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2924 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: Running task 2965 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c961e1b507439ea1c330271d040ab6ee92c4dce7926f5d1a6aa27a1015e2bb87
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3242 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3266 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3274 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3275 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3280 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3289 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3384 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 3385 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 3386 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 3387 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 3388 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: Running task 3389 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 3390 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3391 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 3392 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3393 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: Running task 3394 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3395 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3396 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 3397 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3398 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: Running task 3399 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3400 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 3401 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3402 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 3403 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 3404 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Succeeded
NOTE: Running task 3405 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3406 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3407 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3408 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3409 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3410 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 19cc089a98f77e08e9f9ea2d7007eb5a13fbc73703034d5bbdc3d372ce429274
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3445 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: Running task 3449 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: Running task 3453 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3473 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: Running task 3479 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Succeeded
NOTE: Running task 3484 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3499 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: Running task 3500 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 3501 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3502 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3503 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: Running task 3504 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: Running task 3505 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3506 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3507 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_patch)
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 3508 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3509 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3510 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: Running task 3511 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic unihash changed to 720a6ae0f1d2b5722a9e8c2c66f349479d5020e4d7403987bab5395e0474c023
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 3512 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3513 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3514 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3515 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 3516 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 3517 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3518 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 3519 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3520 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3521 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3522 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: Running task 3523 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3524 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3525 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.36-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3526 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3527 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3528 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3529 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3530 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe libgudev-234-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3531 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 3532 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3533 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3534 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 3535 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 3536 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: Running task 3537 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3538 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 3539 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3540 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3541 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 3542 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3543 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3544 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 3545 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 3546 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3547 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3548 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3549 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3550 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3551 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3552 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3553 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3554 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3555 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3556 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3557 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Started
NOTE: Running task 3558 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3559 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3560 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 3561 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: Running task 3562 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3563 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 3564 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: Running task 3565 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3566 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 3567 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 3568 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 3569 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3570 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: Running task 3571 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3572 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3573 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3574 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3575 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3576 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe ell-0.36-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: Running task 3577 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: Running task 3578 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3579 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: Running task 3580 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3581 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3582 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe ell-0.36-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3583 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3584 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-234-r0: task do_configure: Succeeded
NOTE: Running task 3585 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3586 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3587 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3588 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-234-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: Running task 3589 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 3590 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: Running task 3591 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3592 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3593 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: Running task 3594 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3595 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3596 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3597 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3598 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3599 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe ell-0.36-r0: task do_compile: Succeeded
NOTE: Running task 3600 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3601 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 3602 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe ell-0.36-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 3603 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe ell-0.36-r0: task do_install: Succeeded
NOTE: Running task 3604 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_populate_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3605 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3606 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package)
NOTE: Running task 3607 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.36-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3608 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 3609 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3610 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3611 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3612 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: Running task 3613 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3614 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_install)
NOTE: Running task 3615 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-234-r0: task do_compile: Succeeded
NOTE: Running task 3616 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_install)
NOTE: recipe libwebp-1.1.0-r0: task do_install: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: Running task 3617 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 3618 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3619 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3620 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-234-r0: task do_install: Started
NOTE: Running task 3621 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 3622 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe libgudev-234-r0: task do_install: Succeeded
NOTE: Running task 3623 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_populate_sysroot)
NOTE: Running task 3624 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Started
NOTE: Running task 3625 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe libgudev-234-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: Running task 3626 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3627 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3628 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 3629 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3630 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3631 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: Running task 3632 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3633 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 3634 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 3635 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 3636 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3637 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3638 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3639 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3640 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 3641 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3642 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3643 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.36-r0: task do_package: Succeeded
NOTE: Running task 3644 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_packagedata)
NOTE: recipe ell-0.36-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3645 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3646 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_compile)
NOTE: recipe ell-0.36-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: Running task 3647 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Started
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3648 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_package: Succeeded
NOTE: Running task 3649 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3650 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3651 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe libgudev-234-r0: task do_packagedata: Succeeded
NOTE: Running task 3652 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3653 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 3654 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3655 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3656 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: Running task 3657 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3658 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3659 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 3660 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3661 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3662 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3663 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3664 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_install)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3665 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3666 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3667 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3668 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3669 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3670 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3671 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3672 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3673 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3674 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3675 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: Running task 3676 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3677 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3678 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3679 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3680 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3681 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3682 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3683 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3684 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3685 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3686 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3687 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3688 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3689 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3690 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3691 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3692 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3693 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3694 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3695 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3696 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3697 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3698 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3699 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3700 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3701 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: Running task 3702 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3703 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3704 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3705 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3706 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3707 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3708 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3709 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3710 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: Running task 3711 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3712 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3713 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3714 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3715 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3716 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3717 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3718 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3719 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3720 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3721 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3722 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3723 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3724 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_configure)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3725 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3726 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3727 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3728 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3729 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3730 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3731 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3732 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Succeeded
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3733 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3734 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3735 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3736 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3737 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3738 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: Running task 3739 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3740 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3741 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3742 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package)
NOTE: Running task 3743 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3744 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3745 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3746 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: Running task 3747 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3748 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3749 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3750 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3751 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3752 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3753 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3754 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3755 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3756 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Succeeded
NOTE: Running task 3757 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_compile)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Succeeded
NOTE: Running task 3758 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_install)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3759 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3760 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3761 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3762 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Succeeded
NOTE: Running task 3763 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3764 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: Running task 3765 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Succeeded
NOTE: Running task 3766 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3767 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package_write_rpm)
NOTE: Running task 3768 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3769 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3770 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3771 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3772 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3773 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3774 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package)
NOTE: Running task 3775 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3776 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3777 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3778 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3779 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_configure)
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3780 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 3781 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_compile)
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3782 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3783 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3784 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 3785 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_install)
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 3786 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3787 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3788 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3789 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3790 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3791 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3792 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package)
NOTE: Running task 3793 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3794 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3795 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3796 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3797 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3798 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: Running task 3799 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 3800 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3801 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3802 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3803 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3804 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3805 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3806 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3807 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3808 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3809 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3810 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 3811 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3812 of 3812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3812 tasks of which 3307 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 62 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2633998693014737417==
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
DISTRO_VERSION       = "3.2+snapshot-a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a901fe17536aa1a7846eb0c2c5398ad2c2583ce0"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 226 Found 24 Missed 202 Current 1024 (10% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1051 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1052 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1248 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-src went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dbg went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-staticdev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-dev went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-doc went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy-locale went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
ERROR: libepoxy-1.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libepoxy went backwards which would break package feeds (from 0:1.5.5-r0 to 0:1.5.4-r0) [version-going-backwards]
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1250 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1742 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1760 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 1766 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_fetch)
NOTE: Running task 1920 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1929 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1934 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1937 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1938 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1963 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1985 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1986 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 1987 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 2001 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 2002 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_fetch: Succeeded
NOTE: Running task 2003 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 2037 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 2042 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_fetch)
NOTE: Running task 2062 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2063 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_fetch)
NOTE: Running task 2068 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe ell-0.36-r0: task do_fetch: Started
NOTE: Running task 2127 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_fetch)
NOTE: Running task 2128 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: Running task 2133 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 2136 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_fetch)
NOTE: Running task 2164 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_fetch)
NOTE: Running task 2187 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: recipe ell-0.36-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: Running task 2216 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2217 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2218 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2219 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2220 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 2221 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: Running task 2232 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2233 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2234 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2235 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Started
NOTE: Running task 2236 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 2243 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_fetch)
NOTE: Running task 2245 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_fetch)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Started
NOTE: Running task 2256 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: Running task 2266 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2267 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-234-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Started
NOTE: recipe libcroco-0.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 2291 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_unpack)
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Started
NOTE: Running task 2296 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_write_config)
NOTE: Running task 2304 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_fetch)
NOTE: Running task 2305 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_fetch)
NOTE: Running task 2306 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_fetch)
NOTE: Running task 2307 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2308 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: recipe libgudev-234-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: Running task 2309 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_fetch)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 2366 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: Running task 2376 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Started
NOTE: Running task 2377 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_unpack)
NOTE: Running task 2378 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_unpack)
NOTE: Running task 2379 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: Running task 2380 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Started
NOTE: recipe ell-0.36-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: Running task 2381 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_fetch: Succeeded
NOTE: Running task 2397 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2398 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: Running task 2399 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2400 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_unpack)
NOTE: Running task 2401 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2402 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_unpack)
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Started
NOTE: Running task 2403 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_write_config)
NOTE: Running task 2415 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_write_config)
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: Running task 2429 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_fetch)
NOTE: Running task 2430 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.24-r0: task do_unpack: Succeeded
NOTE: Running task 2431 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe taglib-1.11.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2455 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: Running task 2478 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Started
NOTE: Running task 2479 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2480 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2481 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_unpack)
NOTE: Running task 2482 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_unpack)
NOTE: Running task 2494 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe pulseaudio-14.0-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: Running task 2513 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_write_config)
NOTE: Running task 2527 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_fetch)
NOTE: Running task 2528 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_fetch)
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: Running task 2529 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_fetch)
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-234-r0: task do_unpack: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Started
NOTE: Running task 2530 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2531 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Started
NOTE: Running task 2566 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 2567 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_unpack)
NOTE: Running task 2568 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2569 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: Running task 2570 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_patch)
NOTE: Running task 2571 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2572 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_unpack)
NOTE: Running task 2573 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2588 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_fetch)
NOTE: Running task 2589 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2599 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2600 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: recipe ell-0.36-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Started
NOTE: Running task 2601 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Started
NOTE: Running task 2602 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_write_config: Succeeded
NOTE: Running task 2603 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 2604 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2605 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Started
NOTE: Running task 2606 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 2607 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_patch)
NOTE: Running task 2608 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_fetch: Succeeded
NOTE: Running task 2630 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 2638 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Started
NOTE: Running task 2639 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2660 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe taglib-1.11.1-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Started
NOTE: recipe ell-0.36-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2685 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: Running task 2707 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_unpack)
NOTE: Running task 2708 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_unpack)
NOTE: Running task 2709 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_unpack)
NOTE: recipe libgudev-234-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: Running task 2733 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_patch)
NOTE: Running task 2734 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_patch)
NOTE: Running task 2735 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 2738 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 2747 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: Running task 2776 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_patch: Started
NOTE: Running task 2792 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Started
NOTE: Running task 2793 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: Running task 2794 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_write_config)
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: Running task 2834 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: Running task 2835 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: Running task 2836 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: Running task 2859 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe ell-0.36-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Started
NOTE: Running task 2867 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2868 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_deploy_source_date_epoch)
NOTE: Running task 2879 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_write_config)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_unpack: Succeeded
NOTE: Running task 2880 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Started
NOTE: Running task 2881 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-234-r0: task do_patch: Started
NOTE: Running task 2882 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_write_config)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2883 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_write_config)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_patch: Succeeded
NOTE: Running task 2886 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Started
NOTE: Running task 2887 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 2888 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2889 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: Running task 2910 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-234-r0: task do_patch: Succeeded
NOTE: Running task 2911 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_patch)
NOTE: Running task 2916 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_deploy_source_date_epoch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Started
NOTE: Running task 2933 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Started
NOTE: Running task 2946 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe libwebp-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_write_config: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_patch: Succeeded
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Started
NOTE: Running task 2998 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2999 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3000 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_unpack: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 3001 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 3002 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_patch)
NOTE: Running task 3003 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 3004 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: Running task 3005 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe librsvg-2.40.21-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3027 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_unpack: Succeeded
NOTE: Running task 3099 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3109 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe liba52-0.7.4-r4: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: Running task 3137 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_patch)
NOTE: Running task 3152 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: Running task 3153 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_patch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3169 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3170 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 3171 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3220 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gst-examples-1.18.3-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 3244 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: Running task 3245 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_patch)
NOTE: recipe liba52-0.7.4-r4: task do_patch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Started
NOTE: Running task 3264 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3265 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Started
NOTE: Running task 3266 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3267 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_patch: Succeeded
NOTE: Running task 3268 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3269 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: Running task 3270 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-234-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Started
NOTE: Running task 3271 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3272 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.26.3-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3273 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3274 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libcroco-0.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3275 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: Running task 3276 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3277 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3278 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 3279 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: Running task 3280 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3281 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.40.21-r0: task do_patch: Succeeded
NOTE: Running task 3282 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3283 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Running task 3284 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3285 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.66.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3286 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Running task 3287 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_generate_toolchain_file)
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3288 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3289 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe liba52-0.7.4-r4: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Running task 3290 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3291 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 3292 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic)
NOTE: Running task 3293 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Started
NOTE: Running task 3294 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3295 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3296 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cd4c61dd8a6ed1b3ad75c3dc51c019d64a81088a9ff8e572e5451c8eccc1c2bf
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.11.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mpg123-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_configure: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3370 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3394 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3402 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3403 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3404 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 3405 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3406 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe taglib-1.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3411 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_lic unihash changed to 720a6ae0f1d2b5722a9e8c2c66f349479d5020e4d7403987bab5395e0474c023
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3413 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3421 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe gst-examples-1.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3422 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_configure)
NOTE: Running task 3423 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_patch: Succeeded
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3424 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3425 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3426 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_configure)
NOTE: recipe ffmpeg-4.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: Running task 3427 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_patch)
NOTE: Running task 3439 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Started
NOTE: Running task 3451 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: Running task 3459 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 3460 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 3461 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3462 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2a19e722cc67a7f7657c848ae4d23cc5d17c2bda02f1f9ef02bd50166c44b01a
NOTE: Setscene tasks completed
NOTE: Running task 3527 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3546 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 3547 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe ell-0.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3548 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_configure)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe ell-0.36-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3549 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3550 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_configure)
NOTE: recipe glib-networking-2.66.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3551 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3552 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_configure: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_configure: Succeeded
NOTE: Running task 3553 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_configure: Succeeded
NOTE: Running task 3554 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_compile)
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure: Succeeded
NOTE: Running task 3555 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3556 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 3557 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 3558 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 3559 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 3560 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 3561 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile: Succeeded
NOTE: Running task 3562 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_compile_ptest_base)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3563 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install)
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 3564 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe taglib-1.11.1-r0: task do_compile: Succeeded
NOTE: Running task 3565 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe taglib-1.11.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 3566 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe taglib-1.11.1-r0: task do_install: Succeeded
NOTE: Running task 3567 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package)
NOTE: Running task 3568 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_install: Succeeded
NOTE: Running task 3569 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_install_ptest_base)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.66.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3570 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package)
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Started
NOTE: recipe liba52-0.7.4-r4: task do_configure: Succeeded
NOTE: Running task 3571 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 3572 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 3573 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3574 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_compile: Succeeded
NOTE: Running task 3575 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 3576 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 3577 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Started
NOTE: recipe taglib-1.11.1-r0: task do_package: Succeeded
NOTE: Running task 3578 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_packagedata)
NOTE: recipe liba52-0.7.4-r4: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Started
NOTE: recipe liba52-0.7.4-r4: task do_install: Succeeded
NOTE: Running task 3579 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package)
NOTE: Running task 3580 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_populate_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Started
NOTE: recipe taglib-1.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3581 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.11.1.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3582 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3583 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe liba52-0.7.4-r4: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package: Succeeded
NOTE: Running task 3584 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.24-r0: task do_configure: Succeeded
NOTE: Running task 3585 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_configure_ptest_base)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 3586 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 3587 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3588 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 3589 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3590 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 3591 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_compile: Succeeded
NOTE: Running task 3592 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_compile_ptest_base)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 3593 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe glib-networking-2.66.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3594 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 3595 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 3596 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3597 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libusb1-1.0.24-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Started
NOTE: Running task 3598 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install: Started
NOTE: recipe liba52-0.7.4-r4: task do_package: Succeeded
NOTE: Running task 3599 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3600 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe ell-0.36-r0: task do_configure: Succeeded
NOTE: Running task 3601 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_compile)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install: Succeeded
NOTE: Running task 3602 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_install_ptest_base)
NOTE: recipe ell-0.36-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3603 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3604 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3605 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_populate_sysroot)
NOTE: Running task 3606 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3607 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_install)
NOTE: recipe liba52-0.7.4-r4: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_package: Started
NOTE: Running task 3608 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/liba52/liba52_0.7.4.bb:do_package_write_rpm)
NOTE: recipe taglib-1.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_compile: Succeeded
NOTE: Running task 3609 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3610 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3611 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libusb1-1.0.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-234-r0: task do_configure: Succeeded
NOTE: Running task 3612 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_install: Succeeded
NOTE: Running task 3613 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: Running task 3614 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: recipe libgudev-234-r0: task do_compile: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_install: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Started
NOTE: Running task 3615 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package)
NOTE: Running task 3616 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: Running task 3617 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_populate_sysroot)
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 3618 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe liba52-0.7.4-r4: task do_package_write_rpm: Succeeded
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe ell-0.36-r0: task do_compile: Succeeded
NOTE: Running task 3619 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3620 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.36-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3621 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 3622 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3623 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: Running task 3624 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe ell-0.36-r0: task do_install: Succeeded
NOTE: Running task 3625 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_populate_sysroot)
NOTE: Running task 3626 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 3627 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: Running task 3628 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 3629 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: Running task 3630 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.36-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3631 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_configure)
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 3632 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe ell-0.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3633 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe glib-networking-2.66.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3634 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3635 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3636 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3637 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3638 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3639 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libgudev-234-r0: task do_compile: Succeeded
NOTE: Running task 3640 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package: Succeeded
NOTE: Running task 3641 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_packagedata)
NOTE: recipe libwebp-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3642 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package: Succeeded
NOTE: Running task 3643 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe libgudev-234-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3644 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libwebp-1.1.0-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Started
NOTE: Running task 3645 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-234-r0: task do_install: Succeeded
NOTE: Running task 3646 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_populate_sysroot)
NOTE: Running task 3647 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package)
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3648 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: Running task 3649 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 3650 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3651 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.24.bb:do_package_write_rpm)
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_packagedata: Succeeded
NOTE: Running task 3652 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libgudev-234-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Started
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: recipe mpeg2dec-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3653 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: Running task 3654 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: Running task 3655 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 3656 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 3657 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.1.0-r0: task do_package: Started
NOTE: Running task 3658 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3659 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: Running task 3660 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_configure)
NOTE: recipe libgudev-234-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3661 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3662 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: Running task 3663 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 3664 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 3665 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe libusb1-1.0.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe libwebp-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: Running task 3666 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3667 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.36-r0: task do_package: Succeeded
NOTE: Running task 3668 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3669 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.36-r0: task do_packagedata: Started
NOTE: recipe mpeg2dec-0.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3670 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe ell-0.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3671 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.36.bb:do_package_write_rpm)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-234-r0: task do_package: Succeeded
NOTE: Running task 3672 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_packagedata)
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Started
NOTE: recipe libgudev-234-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3673 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3674 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_configure)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe lame-3.100-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-234-r0: task do_packagedata: Succeeded
NOTE: Running task 3675 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_234.bb:do_package_write_rpm)
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3676 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3677 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe ell-0.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3678 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe libgudev-234-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3011+gitAUTOINC+d198931a63-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 3679 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 3680 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_packagedata)
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3681 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3682 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3683 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_compile)
NOTE: recipe libwebp-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3684 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3685 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 3686 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_compile)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3687 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3688 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3689 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: Running task 3690 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3691 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3692 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3693 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3694 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3695 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package)
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3696 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: Running task 3697 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3698 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: Running task 3699 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3700 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3701 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3702 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3703 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3704 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe speex-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3705 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe ffmpeg-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3706 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3707 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 3708 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_install)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3709 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3710 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 3711 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package)
NOTE: Running task 3712 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_populate_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3713 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3714 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 3715 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3716 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3717 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 3718 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3719 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3720 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.72.0.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3721 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3722 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3723 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3724 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe librsvg-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3725 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: Running task 3726 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package)
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Started
NOTE: recipe librsvg-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3727 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3728 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3729 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3730 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3731 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3732 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package: Succeeded
NOTE: Running task 3733 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_packagedata)
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.40.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3734 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3735 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3736 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.40.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ffmpeg-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3737 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_install: Succeeded
NOTE: Running task 3738 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package)
NOTE: Running task 3739 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_populate_sysroot)
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3740 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe ffmpeg-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3741 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3742 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3743 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3744 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3745 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3746 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3747 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3748 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3749 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3750 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3751 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3752 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3753 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3754 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3755 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3756 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_install: Succeeded
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3757 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3758 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3759 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3760 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3761 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3762 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3763 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3764 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3765 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3766 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3767 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 3768 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_packagedata)
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3769 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3770 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package)
NOTE: Running task 3771 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3772 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3773 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3774 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3775 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3776 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-libav-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3777 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3778 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3779 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3780 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3781 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Succeeded
NOTE: Running task 3782 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_compile)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Succeeded
NOTE: Running task 3783 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_install)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3784 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3785 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Succeeded
NOTE: Running task 3786 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package)
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3787 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3788 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe ffmpeg-4.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3789 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3790 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3791 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package)
NOTE: Running task 3792 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Succeeded
NOTE: Running task 3793 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3794 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3795 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3796 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: Running task 3797 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3798 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3799 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3800 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_configure)
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3801 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3802 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_configure: Succeeded
NOTE: Running task 3803 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3804 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3805 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3806 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3807 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_compile: Succeeded
NOTE: Running task 3808 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_install)
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_install: Succeeded
NOTE: Running task 3809 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_populate_sysroot)
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3810 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe gst-examples-1.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3811 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3812 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3813 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 3814 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3815 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package)
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Started
NOTE: Running task 3816 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb:do_package_write_rpm)
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3817 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3818 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3819 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 3820 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_install)
NOTE: recipe mpg123-1.26.3-r0: task do_install: Started
NOTE: recipe mpg123-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 3821 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package)
NOTE: Running task 3822 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Started
NOTE: recipe mpg123-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3823 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_package: Succeeded
NOTE: Running task 3824 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_packagedata)
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3825 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 3826 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_packagedata)
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3827 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.26.3.bb:do_package_write_rpm)
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_configure: Succeeded
NOTE: Running task 3828 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_compile: Succeeded
NOTE: Running task 3829 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_install: Succeeded
NOTE: Running task 3830 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package: Succeeded
NOTE: Running task 3831 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3832 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb:do_package_write_rpm)
NOTE: Running task 3833 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_write_rpm)
NOTE: Running task 3834 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Started
NOTE: recipe gst-examples-1.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe gst-examples-1.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3835 of 3835 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3835 tasks of which 3330 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2633998693014737417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gst-examples/gst-examples-dbg: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-dbg: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gst-examples/gst-examples-dev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-dev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gst-examples/gst-examples-doc: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-doc: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gst-examples/gst-examples-locale: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-locale: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gst-examples/gst-examples-src: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-src: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gst-examples/gst-examples-staticdev: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples-staticdev: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gst-examples/gst-examples: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gst-examples/gst-examples: PV changed from "1.18.2" to "1.18.3"
packages/core2-32-poky-linux/gst-examples: PKGV changed from 1.18.2 [default] to 1.18.3 [default]
packages/core2-32-poky-linux/gst-examples: PV changed from "1.18.2" to "1.18.3"

--===============2633998693014737417==--
