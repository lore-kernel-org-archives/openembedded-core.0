Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.5913.1626056248647119467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id C174938C12A7
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.28.1 SUCCEEDED
Message-ID: <MADEUP.1690E98B219D0CEA.19620@lists.openembedded.org>
X-Groupsio-MsgNum: 153751
Content-Type: multipart/mixed; boundary="===============1053374030527869424=="

--===============1053374030527869424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.28.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.28.0-1.28.1.patch
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

--===============1053374030527869424==
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
DISTRO_VERSION       = "3.3+snapshot-61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 139 Local 4 Network 0 Missed 135 Current 883 (2% match, 86% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 903 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1196 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1380 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_fetch)
NOTE: Running task 1390 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1494 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_fetch)
NOTE: Running task 1520 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1521 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1570 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 1670 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe bluez5-5.59-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1725 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1726 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1727 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1730 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: Running task 1731 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_fetch)
NOTE: recipe bluez5-5.59-r0: task do_fetch: Succeeded
NOTE: Running task 1765 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Started
NOTE: Running task 1766 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1777 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1812 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1813 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_unpack)
NOTE: Running task 1814 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1815 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1816 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 1817 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1818 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1819 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1820 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 1862 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1865 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1908 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1913 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: Running task 1916 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe ell-0.41-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe ell-0.41-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 1983 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 1985 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1986 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 1987 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.59-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: Running task 1995 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 1996 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1997 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1998 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running task 2003 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: Running task 2004 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2021 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2029 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2032 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2033 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2034 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe ell-0.41-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: Running task 2051 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2062 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2081 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: Running task 2084 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2099 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2130 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 2195 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2218 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_fetch)
NOTE: Running task 2223 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2224 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 2225 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2226 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: Running task 2243 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: Running task 2257 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: Running task 2311 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_patch)
NOTE: recipe ell-0.41-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 2312 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 2313 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: Running task 2314 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_patch)
NOTE: Running task 2331 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: Running task 2345 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: Running task 2346 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2361 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2398 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2409 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe bluez5-5.59-r0: task do_unpack: Succeeded
NOTE: Running task 2410 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_unpack)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_patch)
NOTE: Running task 2436 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: Running task 2471 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2484 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2485 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_unpack)
NOTE: Running task 2486 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Started
NOTE: Running task 2487 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: Running task 2500 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: Running task 2501 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2502 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: Running task 2509 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Succeeded
NOTE: recipe ell-0.41-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2522 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: Running task 2532 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: Running task 2547 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2548 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2569 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 2580 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.59-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: Running task 2617 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2618 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe ell-0.41-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: Running task 2671 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 2672 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2673 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: Running task 2674 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2731 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2732 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2733 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2734 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2735 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2736 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: Running task 2737 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2738 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 2739 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: Running task 2740 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2741 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2742 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2743 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2744 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2745 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: Running task 2746 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: Running task 2747 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Running task 2748 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_patch)
NOTE: Running task 2749 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2750 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2751 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2752 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2753 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2754 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: Running task 2755 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: Running task 2756 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2757 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2758 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2759 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5aee81357375e47dc74dc1ce0f9da0415214c11d6cfe8e8cec85f100f054322d
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Started
NOTE: Running task 2783 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2797 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Started
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2817 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2845 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2855 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic unihash changed to 4b7789211768b530daa837106b961901ea3bb56612bb4e0fa22d41b4d319e19f
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2856 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2857 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 2858 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: Running task 2859 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2860 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1ba205c5dff935439a6ba9665c1d19358d3b94d9a604c5237ddb3df6adced49e
NOTE: Setscene tasks completed
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2889 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: Running task 2918 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2922 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_configure)
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2923 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2924 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.41-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2926 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2927 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2929 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2930 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2931 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2932 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2933 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2934 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2937 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2938 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2940 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2941 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 2942 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: Running task 2943 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_configure: Succeeded
NOTE: Running task 2944 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure_ptest_base)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2945 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2946 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2947 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: Running task 2948 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2949 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2950 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2951 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe bluez5-5.59-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2952 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2953 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2954 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2955 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2956 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: Running task 2957 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2959 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2960 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: Running task 2961 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2962 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2963 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2964 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2965 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2966 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2967 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2968 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2969 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: Running task 2970 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2971 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe ell-0.41-r0: task do_configure: Succeeded
NOTE: Running task 2972 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe ell-0.41-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2973 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2974 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2975 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2976 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2977 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.41-r0: task do_compile: Succeeded
NOTE: Running task 2978 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.41-r0: task do_install: Started
NOTE: recipe ell-0.41-r0: task do_install: Succeeded
NOTE: Running task 2979 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_populate_sysroot)
NOTE: Running task 2980 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package)
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2981 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2983 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2984 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe ell-0.41-r0: task do_package: Succeeded
NOTE: Running task 2985 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_packagedata)
NOTE: recipe ell-0.41-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2986 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2987 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2988 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2989 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2990 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2991 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2992 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2993 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2994 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2995 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe bluez5-5.59-r0: task do_compile: Succeeded
NOTE: Running task 2996 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2997 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2998 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2999 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3000 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3001 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_populate_sysroot)
NOTE: Running task 3002 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3003 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3004 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3005 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3007 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3009 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3010 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3012 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3015 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3016 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3017 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3018 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3021 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3022 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3023 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3024 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3025 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3026 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3027 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3028 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3029 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3030 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3031 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_configure)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3032 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3033 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.59-r0: task do_install: Succeeded
NOTE: Running task 3034 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3035 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_populate_sysroot)
NOTE: Running task 3036 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package)
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3037 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3038 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_package: Succeeded
NOTE: Running task 3039 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_packagedata)
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Started
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Succeeded
NOTE: Running task 3040 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3043 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3044 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3045 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3046 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3047 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: Running task 3048 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3049 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3050 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 3051 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_configure: Succeeded
NOTE: Running task 3052 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_compile)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_compile: Succeeded
NOTE: Running task 3053 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_install)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_install: Succeeded
NOTE: Running task 3054 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_package)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 3055 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 3057 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package: Succeeded
NOTE: Running task 3058 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3059 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_package_write_rpm)
NOTE: Running task 3060 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3061 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3062 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3063 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3066 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3067 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3068 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3070 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3071 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3072 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3073 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3074 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3075 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3076 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3077 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3078 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3079 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3080 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3081 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3082 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3083 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3084 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3085 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3086 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3087 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_compile)
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Started
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Started
NOTE: Running task 3090 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3092 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3094 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3095 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3096 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3097 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3098 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3099 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package_write_rpm)
NOTE: Running task 3100 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3104 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Succeeded
NOTE: Running task 3105 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3106 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3107 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_install)
NOTE: recipe mpg123-1.28.1-r0: task do_install: Started
NOTE: recipe mpg123-1.28.1-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package)
NOTE: Running task 3110 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_package: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package: Succeeded
NOTE: Running task 3111 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_packagedata)
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3112 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_write_rpm)
NOTE: Running task 3113 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_qa)
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3114 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3114 tasks of which 2784 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============1053374030527869424==
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
DISTRO_VERSION       = "3.3+snapshot-61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 141 Local 6 Network 0 Missed 135 Current 881 (4% match, 86% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 901 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 902 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1021 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1022 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1196 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1380 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_fetch)
NOTE: Running task 1390 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1494 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_fetch)
NOTE: Running task 1520 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1521 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1570 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 1670 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: recipe bluez5-5.59-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1706 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1707 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1727 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1730 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: Running task 1731 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_fetch)
NOTE: recipe bluez5-5.59-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 1758 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_unpack)
NOTE: Running task 1766 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1767 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1800 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_unpack)
NOTE: Running task 1801 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1802 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1815 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1816 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1817 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1818 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 1819 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1843 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1864 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 1876 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1912 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 1924 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1925 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe ell-0.41-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1962 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: Running task 1963 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.41-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: Running task 1964 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1965 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_unpack)
NOTE: Running task 1966 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: Running task 1967 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1982 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: Running task 1995 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 1996 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1998 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1999 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2009 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: Running task 2010 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 2031 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2032 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2033 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: Running task 2034 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe ell-0.41-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2051 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: Running task 2067 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2068 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: Running task 2082 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 2085 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: Running task 2130 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: Running task 2149 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2157 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2182 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2189 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: Running task 2190 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 2191 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2218 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: Running task 2219 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_patch)
NOTE: Running task 2221 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2230 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2231 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2232 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 2233 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_fetch)
NOTE: Running task 2234 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.41-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Started
NOTE: Running task 2239 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 2240 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2244 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2245 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2246 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: Running task 2260 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2261 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_unpack)
NOTE: Running task 2262 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.59-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Started
NOTE: Running task 2319 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_patch)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2349 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: Running task 2351 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 2353 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 2362 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2363 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe ell-0.41-r0: task do_patch: Started
NOTE: Running task 2378 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2379 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2380 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2383 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 2386 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_unpack)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2394 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2419 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: Running task 2427 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe bluez5-5.59-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2492 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 2516 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2517 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2518 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2535 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: recipe ell-0.41-r0: task do_patch: Succeeded
NOTE: Running task 2536 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2537 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 2538 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: Running task 2563 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: Running task 2564 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2603 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: Running task 2658 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: Running task 2668 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2683 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2684 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2705 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2724 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_configure)
NOTE: Running task 2725 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2744 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: Running task 2745 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2746 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: Running task 2747 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: Running task 2748 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_deploy_source_date_epoch)
NOTE: Running task 2749 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2750 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2751 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2752 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2753 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: Running task 2754 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2755 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2756 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2757 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic)
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2758 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dabf505693ad0159cbe77fbdafa5f556db7151d2c6d49eedb0615e89417b5252
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: Running task 2782 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2796 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2816 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2840 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2841 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2846 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic unihash changed to 4b7789211768b530daa837106b961901ea3bb56612bb4e0fa22d41b4d319e19f
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2856 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2857 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 2858 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2859 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2860 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2861 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 73d88f4e8b858d1118c121c8b4f8d71ef1c1f032f356d1be99797c697f234ee2
NOTE: Setscene tasks completed
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: Running task 2920 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2922 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure)
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2923 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2924 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.41-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2926 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2927 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2929 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2930 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2931 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2932 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2933 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2934 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2937 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2938 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2940 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: Running task 2941 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2942 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 2943 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: Running task 2944 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2945 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2946 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2947 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.59-r0: task do_configure: Succeeded
NOTE: Running task 2948 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure_ptest_base)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2949 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2950 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2951 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2952 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2953 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2954 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2955 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2956 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2957 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2958 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 2959 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: Running task 2960 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2961 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2962 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2963 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2964 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2965 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2966 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2967 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2968 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2969 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2970 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2971 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2972 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe ell-0.41-r0: task do_configure: Succeeded
NOTE: Running task 2973 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe ell-0.41-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2974 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2975 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2977 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.41-r0: task do_compile: Succeeded
NOTE: Running task 2978 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_install)
NOTE: recipe ell-0.41-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.41-r0: task do_install: Succeeded
NOTE: Running task 2979 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_populate_sysroot)
NOTE: Running task 2980 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package)
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_package: Started
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2981 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_compile: Succeeded
NOTE: Running task 2983 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile_ptest_base)
NOTE: recipe ell-0.41-r0: task do_package: Succeeded
NOTE: Running task 2984 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2985 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Started
NOTE: Running task 2986 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe ell-0.41-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe ell-0.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2987 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2988 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Started
NOTE: Running task 2989 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2990 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2991 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2992 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2993 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2994 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2995 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2996 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2997 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2998 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2999 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3000 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3001 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_populate_sysroot)
NOTE: Running task 3002 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3003 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3004 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3005 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3007 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3008 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3009 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3010 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3012 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3015 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3016 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3017 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3018 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3019 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3021 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3022 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3023 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3025 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3026 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3027 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_install: Succeeded
NOTE: Running task 3028 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3029 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_populate_sysroot)
NOTE: Running task 3030 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package)
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3032 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3033 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3034 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3035 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3036 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3037 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_configure)
NOTE: recipe bluez5-5.59-r0: task do_package: Succeeded
NOTE: Running task 3038 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Started
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Succeeded
NOTE: Running task 3039 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 3042 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3043 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3044 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3045 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3047 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3048 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 3049 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 3050 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3051 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3052 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3053 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3054 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_configure: Succeeded
NOTE: Running task 3055 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_compile)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_compile: Succeeded
NOTE: Running task 3056 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_install)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_install: Started
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 3057 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_package)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 3059 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package: Succeeded
NOTE: Running task 3060 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3061 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_package_write_rpm)
NOTE: Running task 3062 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3064 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3066 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3067 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3068 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: Running task 3070 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3071 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3072 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3073 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3074 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3075 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3076 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3077 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3078 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3079 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3080 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3081 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3082 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3083 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3084 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3085 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3086 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3087 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_compile)
NOTE: Running task 3088 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Started
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3090 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3092 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_install)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3094 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3095 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3096 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3097 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3098 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3099 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package_write_rpm)
NOTE: Running task 3100 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3104 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Succeeded
NOTE: Running task 3105 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3106 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3107 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_install)
NOTE: recipe mpg123-1.28.1-r0: task do_install: Started
NOTE: recipe mpg123-1.28.1-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package)
NOTE: Running task 3110 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_package: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package: Succeeded
NOTE: Running task 3111 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_packagedata)
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3112 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_write_rpm)
NOTE: Running task 3113 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_qa)
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3114 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3114 tasks of which 2784 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============1053374030527869424==
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
DISTRO_VERSION       = "3.3+snapshot-61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 139 Local 4 Network 0 Missed 135 Current 883 (2% match, 86% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 903 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1196 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1380 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_fetch)
NOTE: Running task 1390 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1494 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_fetch)
NOTE: Running task 1520 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1521 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1570 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 1670 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1725 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1728 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: Running task 1729 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_fetch)
NOTE: Running task 1736 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1737 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.59-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Started
NOTE: Running task 1765 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1766 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe bluez5-5.59-r0: task do_fetch: Succeeded
NOTE: Running task 1804 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1812 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1813 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1814 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1815 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_unpack)
NOTE: Running task 1816 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1817 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1818 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1819 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1820 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 1864 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 1896 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1912 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: Running task 1947 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1948 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.41-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 1978 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: Running task 1979 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.41-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: Running task 1993 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_unpack)
NOTE: Running task 1995 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1996 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2004 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 2005 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2006 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2026 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 2027 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2037 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2038 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2046 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: Running task 2070 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2076 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 2077 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: Running task 2080 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 2118 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2119 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2127 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_fetch)
NOTE: Running task 2139 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2182 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2183 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2208 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2222 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2223 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2224 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 2225 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 2380 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: Running task 2387 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: Running task 2403 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe ell-0.41-r0: task do_unpack: Succeeded
NOTE: Running task 2404 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2412 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_patch)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Started
NOTE: Running task 2424 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: Running task 2425 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 2428 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2433 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: Running task 2438 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_patch)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Started
NOTE: Running task 2439 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2440 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 2445 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_unpack)
NOTE: Running task 2451 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_unpack)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: Running task 2462 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2476 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2477 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2478 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: Running task 2479 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2487 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: Running task 2503 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: Running task 2525 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2535 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.41-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: Running task 2599 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2618 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_unpack: Started
NOTE: Running task 2641 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2659 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 2660 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2661 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: Running task 2672 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2683 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: Running task 2695 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2706 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2719 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.41-r0: task do_patch: Succeeded
NOTE: Running task 2729 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_patch: Started
NOTE: Running task 2730 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 2731 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2732 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2733 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: Running task 2734 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 2735 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2736 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2737 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2738 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2739 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_patch)
NOTE: Running task 2740 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2741 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2742 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2743 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Started
NOTE: Running task 2744 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 2745 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2746 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2747 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: Running task 2748 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe bluez5-5.59-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2749 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 2750 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: Running task 2751 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_deploy_source_date_epoch)
NOTE: Running task 2752 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_configure)
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 2753 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2754 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2755 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2756 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2757 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: Running task 2758 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2759 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2760 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2761 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f65cba28dda80dce1f2749d91bd589828425857f2542302d949145a6c87a2bb
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic unihash changed to 4b7789211768b530daa837106b961901ea3bb56612bb4e0fa22d41b4d319e19f
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2785 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2799 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2819 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2845 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: Running task 2852 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2858 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2859 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2860 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2861 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f1e9d25143136ff89df75508547a4b21e157890b8aa17cc5fc7c213b42812a51
NOTE: Setscene tasks completed
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2905 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2918 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2919 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_configure)
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2924 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe ell-0.41-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2926 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2927 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2929 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2930 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2931 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2932 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2933 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2934 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2937 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: Running task 2938 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2940 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2941 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2942 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 2943 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: Running task 2944 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2945 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe bluez5-5.59-r0: task do_configure: Succeeded
NOTE: Running task 2946 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure_ptest_base)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2947 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_compile)
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2948 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2949 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.59-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2950 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2951 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2952 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2953 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2954 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2955 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2956 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2957 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2958 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2959 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 2960 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2961 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: Running task 2962 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2963 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2964 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2965 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: Running task 2966 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2967 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2968 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2969 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2970 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe ell-0.41-r0: task do_configure: Succeeded
NOTE: Running task 2971 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe ell-0.41-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2972 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2973 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2974 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2975 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2976 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.41-r0: task do_compile: Succeeded
NOTE: Running task 2977 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2978 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe ell-0.41-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.41-r0: task do_install: Succeeded
NOTE: Running task 2979 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_populate_sysroot)
NOTE: Running task 2980 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package)
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2981 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe ell-0.41-r0: task do_package: Succeeded
NOTE: Running task 2983 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2985 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe bluez5-5.59-r0: task do_compile: Succeeded
NOTE: Running task 2986 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile_ptest_base)
NOTE: recipe ell-0.41-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2987 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2988 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2989 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package_write_rpm)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2990 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2991 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2992 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2993 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2994 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2995 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2996 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2997 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2998 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2999 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3000 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3001 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3002 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_populate_sysroot)
NOTE: Running task 3003 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3004 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3005 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3006 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3007 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3009 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3010 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3012 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3015 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3016 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3017 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3018 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3021 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3022 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3023 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3025 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3026 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3027 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3028 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3029 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3030 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3031 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_configure)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3032 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3033 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3034 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3035 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3036 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3037 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3038 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3039 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3040 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3041 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3042 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_configure: Succeeded
NOTE: Running task 3043 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_compile)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_compile: Succeeded
NOTE: Running task 3044 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_install)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_install: Succeeded
NOTE: Running task 3045 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_package)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3046 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package: Succeeded
NOTE: Running task 3047 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3048 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_package_write_rpm)
NOTE: Running task 3049 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3050 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3051 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3052 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3053 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3054 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3055 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3056 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3057 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3058 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3059 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3060 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3061 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3062 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3063 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3064 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3065 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3066 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Started
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3067 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_install: Succeeded
NOTE: Running task 3068 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3069 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_populate_sysroot)
NOTE: Running task 3070 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package)
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_package: Started
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3071 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3072 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3073 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_install)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3074 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3075 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3076 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3077 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_package: Succeeded
NOTE: Running task 3078 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_packagedata)
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Started
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Succeeded
NOTE: Running task 3079 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3080 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3081 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3082 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package_write_rpm)
NOTE: Running task 3083 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 3084 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 3085 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 3086 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 3087 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3088 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 3090 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 3091 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3092 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3094 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3095 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3096 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3097 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3098 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3099 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3100 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Succeeded
NOTE: Running task 3104 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_compile)
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3105 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3106 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3107 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_install)
NOTE: recipe mpg123-1.28.1-r0: task do_install: Started
NOTE: recipe mpg123-1.28.1-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package)
NOTE: Running task 3110 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_package: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package: Succeeded
NOTE: Running task 3111 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_packagedata)
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3112 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_write_rpm)
NOTE: Running task 3113 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_qa)
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3114 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3114 tasks of which 2784 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============1053374030527869424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mpg123/mpg123-dev: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libmpg123.so.0.46.3 /usr/lib/libout123.so.0.4.1 /usr/lib/libsyn123.so.0.1.4"
packages/core2-32-poky-linux/mpg123/mpg123-doc: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libmpg123.so.0.46.3 /usr/lib/libout123.so.0.4.1 /usr/lib/libsyn123.so.0.1.4"
packages/core2-32-poky-linux/mpg123/mpg123-locale: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libmpg123.so.0.46.3 /usr/lib/libout123.so.0.4.1 /usr/lib/libsyn123.so.0.1.4"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libmpg123.so.0.46.3 /usr/lib/libout123.so.0.4.1 /usr/lib/libsyn123.so.0.1.4"
packages/core2-32-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libmpg123.so.0.46.3 /usr/lib/libout123.so.0.4.1 /usr/lib/libsyn123.so.0.1.4"
Changes to packages/core2-32-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.46.2 to libmpg123.so.0.46.3
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.46.2 to libmpg123.so.0.46.3
  /usr/lib/libout123.so.0 changed symlink target from libout123.so.0.4.0 to libout123.so.0.4.1
  /usr/lib/libout123.so changed symlink target from libout123.so.0.4.0 to libout123.so.0.4.1
  /usr/lib/libsyn123.so.0 changed symlink target from libsyn123.so.0.1.3 to libsyn123.so.0.1.4
  /usr/lib/libsyn123.so changed symlink target from libsyn123.so.0.1.3 to libsyn123.so.0.1.4
  /usr/lib/libmpg123.so.0.46.2 moved to /usr/lib/libmpg123.so.0.46.3
  /usr/lib/libout123.so.0.4.0 moved to /usr/lib/libout123.so.0.4.1
  /usr/lib/libsyn123.so.0.1.3 moved to /usr/lib/libsyn123.so.0.1.4

--===============1053374030527869424==
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
DISTRO_VERSION       = "3.3+snapshot-61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 139 Local 4 Network 0 Missed 135 Current 883 (2% match, 86% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 903 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 1022 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1196 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1380 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_fetch)
NOTE: Running task 1390 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1494 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_fetch)
NOTE: Running task 1520 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1521 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1570 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 1670 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1682 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe bluez5-5.59-r0: task do_fetch: Started
NOTE: Running task 1683 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.59-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Started
NOTE: Running task 1727 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1728 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_unpack)
NOTE: Running task 1731 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_fetch)
NOTE: Running task 1732 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1766 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1767 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1776 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_unpack)
NOTE: Running task 1777 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1778 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1779 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1816 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1817 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1818 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 1819 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1820 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 1852 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 1865 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1893 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1913 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: Running task 1916 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe ell-0.41-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe bluez5-5.59-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.41-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 1973 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: Running task 1974 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1975 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1976 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_unpack)
NOTE: Running task 1977 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1978 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 1993 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1996 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running task 2003 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: Running task 2004 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2005 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2029 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2030 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2043 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2048 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: Running task 2051 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2052 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2053 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: Running task 2065 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2081 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 2084 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_unpack: Started
NOTE: Running task 2129 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_fetch)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: Running task 2207 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: Running task 2210 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_fetch)
NOTE: Running task 2222 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2223 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2224 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2225 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 2226 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: Running task 2266 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: Running task 2276 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2277 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 2279 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 2299 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 2300 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 2311 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2357 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: Running task 2362 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Started
NOTE: Running task 2377 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2378 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 2382 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.41-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2396 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2397 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_unpack)
NOTE: Running task 2404 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libnss-mdns-0.15.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: Running task 2417 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: Running task 2418 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_unpack)
NOTE: Running task 2431 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2433 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: Running task 2447 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: Running task 2480 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.59-r0: task do_unpack: Succeeded
NOTE: Running task 2482 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: Running task 2483 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2514 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2515 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.41-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: Running task 2576 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 2590 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: Running task 2599 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_unpack: Started
NOTE: Running task 2623 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2639 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: Running task 2652 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2679 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: Running task 2687 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2697 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: recipe bluez5-5.59-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2729 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.41-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2730 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: Running task 2731 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2732 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2733 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: Running task 2734 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: Running task 2735 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Succeeded
NOTE: Running task 2736 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2737 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2738 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2739 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2740 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2741 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_patch)
NOTE: Running task 2742 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2743 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: Running task 2744 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2745 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2746 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: Running task 2747 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_configure)
NOTE: recipe bluez5-5.59-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2748 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_deploy_source_date_epoch)
NOTE: Running task 2749 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2750 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2751 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: Running task 2752 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Succeeded
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: Running task 2753 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2754 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic)
NOTE: Running task 2755 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: Running task 2756 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Started
NOTE: Running task 2757 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2758 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_patch)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2759 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: Running task 2760 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c1c52421c558a99d97195d8181d7a47dd8c9fee192eda9baa2db4e82002169fa
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2784 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2798 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic unihash changed to 4b7789211768b530daa837106b961901ea3bb56612bb4e0fa22d41b4d319e19f
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2818 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2842 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2851 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2857 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2858 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2859 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 2860 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2861 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 28ff717d10eeb38c6dd88776fdf8d650da378f92a7dd91f56cc79b1cc5c8dd0f
NOTE: Setscene tasks completed
NOTE: Running task 2919 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2922 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_configure)
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2923 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure)
NOTE: recipe ell-0.41-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2924 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.59-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: Running task 2926 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2927 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2929 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2930 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2931 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2932 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2933 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2934 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2937 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2938 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2940 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2941 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 2942 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: Running task 2943 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2944 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe bluez5-5.59-r0: task do_configure: Succeeded
NOTE: Running task 2945 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure_ptest_base)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2946 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2947 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Started
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2948 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2949 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: Running task 2950 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2951 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2952 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2953 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2954 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2955 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 2956 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2957 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2958 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2959 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2961 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: Running task 2962 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2963 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2964 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2965 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2966 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2967 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2968 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2969 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2970 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2971 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2972 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe ell-0.41-r0: task do_configure: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: Running task 2973 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe ell-0.41-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2974 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2975 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2977 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.41-r0: task do_compile: Succeeded
NOTE: Running task 2978 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_install)
NOTE: recipe ell-0.41-r0: task do_install: Started
NOTE: recipe ell-0.41-r0: task do_install: Succeeded
NOTE: Running task 2979 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_populate_sysroot)
NOTE: Running task 2980 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_package: Started
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2981 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe ell-0.41-r0: task do_package: Succeeded
NOTE: Running task 2983 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe ell-0.41-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2985 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe bluez5-5.59-r0: task do_compile: Succeeded
NOTE: Running task 2986 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile_ptest_base)
NOTE: recipe ell-0.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2987 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Started
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2988 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2989 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2990 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2991 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2992 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2993 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2994 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2995 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2996 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2997 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2998 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2999 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3000 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3001 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_populate_sysroot)
NOTE: Running task 3002 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3003 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3004 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3005 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3006 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3007 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3009 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3010 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3012 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3015 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3016 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3017 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3018 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3019 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3021 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3022 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3023 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3025 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3026 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3027 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_install: Succeeded
NOTE: Running task 3028 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3029 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_populate_sysroot)
NOTE: Running task 3030 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package)
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_package: Started
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3031 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3032 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_packagedata)
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Started
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Succeeded
NOTE: Running task 3035 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3036 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3037 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3038 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3039 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_configure)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3042 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 3043 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 3044 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 3045 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3047 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3048 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3049 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3050 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3051 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3052 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3053 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3054 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 3055 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 3056 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_configure: Succeeded
NOTE: Running task 3057 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_compile)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_compile: Succeeded
NOTE: Running task 3058 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_install)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_install: Succeeded
NOTE: Running task 3059 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_package)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3060 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package: Succeeded
NOTE: Running task 3061 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3062 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb:do_package_write_rpm)
NOTE: Running task 3063 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3064 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3066 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3067 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3068 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3070 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3071 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3072 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3073 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3074 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3075 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3076 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3077 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3078 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3079 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3080 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3081 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3082 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3083 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3084 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3085 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3086 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3087 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Started
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3090 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3092 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_install)
NOTE: Running task 3093 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3094 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3095 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3096 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3097 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3098 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3099 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package_write_rpm)
NOTE: Running task 3100 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Succeeded
NOTE: Running task 3104 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_compile)
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3105 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3106 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3107 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_install)
NOTE: recipe mpg123-1.28.1-r0: task do_install: Started
NOTE: recipe mpg123-1.28.1-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package)
NOTE: Running task 3110 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_package: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package: Succeeded
NOTE: Running task 3111 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_packagedata)
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3112 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_write_rpm)
NOTE: Running task 3113 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_qa)
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3114 of 3114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3114 tasks of which 2784 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============1053374030527869424==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.28.0-1.28.1.patch"

From b521afa981e560e9b9326c531d1e7922065f109f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 21:04:50 +0000
Subject: [PATCH] mpg123: upgrade 1.28.0 -> 1.28.1

---
 .../mpg123/{mpg123_1.28.0.bb => mpg123_1.28.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.28.0.bb => mpg123_1.28.1.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb
index 143a59ba63..8696e74791 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "e49466853685026da5d113dc7ff026b1b2ad0b57d78df693a446add9db88a7d5"
+SRC_URI[sha256sum] = "85d0b34e14b2d8b35dda7224b2452a7e9e7a3c8eddda595188a5122d0787b9aa"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.20.1


--===============1053374030527869424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (0 cached, 821 parsed). 1458 targets, 43 skipped, 0 masked, 0 errors.
Removing 155 recipes from the core2-32 sysroot...done.
Removing 159 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:61a6c10d1c86be8b8395fb5315ec4ea0c1378699"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 780 Local 648 Network 0 Missed 132 Current 249 (83% match, 87% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 253 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
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
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 332 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 333 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.107.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 340 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pycairo-1.20.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 353 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 354 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 359 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 362 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 364 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 365 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 366 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.107-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 367 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 370 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 372 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 378 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 381 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 382 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 383 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.107-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 388 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 389 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 390 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 468 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 495 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 496 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 497 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 498 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 507 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 508 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 509 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 510 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 511 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 512 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 513 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 514 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 521 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 522 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 528 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 532 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 533 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 534 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 537 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 548 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 550 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 557 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 558 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 559 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 560 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 561 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 566 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 567 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 586 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 600 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 601 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 605 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 607 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 608 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 621 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 627 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: Running task 766 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_fetch)
NOTE: Running task 769 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 794 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_fetch)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 797 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 798 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 802 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running setscene task 668 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 845 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 848 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 849 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: Running task 850 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_fetch)
NOTE: Running task 858 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 874 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 875 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 876 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 877 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 878 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_fetch)
NOTE: Running task 879 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 927 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 935 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe bluez5-5.59-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 987 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: Running task 988 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1000 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 1003 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1009 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_unpack)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 685 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.107.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running task 1019 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_unpack)
NOTE: Running task 1020 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Started
NOTE: recipe ell-0.41-r0: task do_fetch: Started
NOTE: Running setscene task 697 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: Running task 1023 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1027 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 708 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.41-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1035 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: Running task 1040 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1041 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_unpack)
NOTE: Running task 1044 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 1045 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 1047 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 1048 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1049 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 1056 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: Running task 1057 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 1059 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_fetch)
NOTE: Running task 1062 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_unpack)
NOTE: recipe ofono-1.32-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.107-r0: task do_packagedata_setscene: Started
NOTE: Running task 1083 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 1096 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 1097 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_fetch)
NOTE: Running task 1098 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_fetch)
NOTE: Running task 1099 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe ofono-1.32-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.59-r0: task do_unpack: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: Running task 1136 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_unpack)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 717 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1141 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 1184 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.41-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 1243 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 1244 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1259 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1320 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_unpack: Succeeded
NOTE: Running task 1321 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1337 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1338 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_unpack)
NOTE: Running task 1344 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-1.32-r0: task do_unpack: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 721 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running setscene task 726 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 735 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 1352 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_patch)
NOTE: recipe libdrm-2.4.107-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1357 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 741 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running task 1358 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.41-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Started
NOTE: Running task 1367 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: Running task 1369 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpg123-1.28.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Started
NOTE: Running task 1391 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: Running task 1392 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_patch)
NOTE: Running task 1393 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 1394 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 1395 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 1402 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: Running task 1403 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: Running task 1404 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: Running task 1406 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Started
NOTE: Running task 1407 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1408 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.59-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1409 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe ofono-1.32-r0: task do_unpack: Succeeded
NOTE: Running setscene task 754 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1422 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: Running task 1423 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1424 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1426 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1427 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe ell-0.41-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_patch)
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1429 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running setscene task 762 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.59-r0: task do_patch: Started
NOTE: Running task 1430 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe ofono-1.32-r0: task do_patch: Started
NOTE: Running setscene task 766 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe ell-0.41-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 1439 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.28.1-r0: task do_patch: Succeeded
NOTE: Running task 1440 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 1442 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1443 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1444 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1445 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1446 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: Running task 1447 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1452 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.32-r0: task do_patch: Succeeded
NOTE: Running task 1457 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: Running task 1458 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1459 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 774 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running task 1464 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1465 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 780 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1474 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_patch)
NOTE: Running task 1475 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_populate_lic: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_lic unihash changed to 4b7789211768b530daa837106b961901ea3bb56612bb4e0fa22d41b4d319e19f
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 789 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1488 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 1497 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 1498 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 796 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 799 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 807 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1504 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 830 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 832 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 835 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1523 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.47+gitAUTOINC+82899c6a71_52bcc5b234-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 854 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 862 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1538 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1539 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 870 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 873 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1584 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 887 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 888 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 889 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1597 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 894 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 896 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1606 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 898 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 900 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 901 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 910 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 911 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 914 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1615 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 916 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 918 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 927 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 928 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 942 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 943 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 945 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running setscene task 950 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 951 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 952 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1654 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 964 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 965 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 967 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 978 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 979 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1711 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 985 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ca17797dcb58838ff90c4eb78986bc0e3463a242f2c6801bddee43de51bfe2c9
NOTE: Running task 1720 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 994 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 996 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 999 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1000 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1005 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1009 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1017 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1023 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1024 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1026 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1027 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1030 of 1029 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2062 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2187 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2255 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2387 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2389 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2390 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2417 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2433 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2434 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2603 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2759 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2778 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2779 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2780 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 90d527c965ea68cb21fb129de4b81bdaefc2f7e60a656fb921a1df77119a739f
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2804 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Started
NOTE: Running task 2824 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2825 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: Running task 2826 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Running task 2827 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 2831 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: Running task 2855 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2893 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2938 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2939 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2940 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe bluez5-5.59-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2941 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure)
NOTE: recipe ell-0.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2942 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe ell-0.41-r0: task do_configure: Started
NOTE: recipe bluez5-5.59-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2944 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_configure: Succeeded
NOTE: Running task 2945 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_compile: Succeeded
NOTE: Running task 2946 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_install: Succeeded
NOTE: Running task 2947 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2948 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package: Succeeded
NOTE: Running task 2949 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata: Succeeded
NOTE: Running task 2950 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2951 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2952 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 2953 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2954 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2955 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2956 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 2957 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2959 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: Running task 2960 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: Running task 2961 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2962 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2963 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: Running task 2964 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe bluez5-5.59-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2965 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_configure_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2966 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2967 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Started
NOTE: recipe bluez5-5.59-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2968 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2969 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2970 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2971 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2972 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2973 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2974 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2975 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2976 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2977 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2978 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2979 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2980 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2981 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 2982 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2983 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2984 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2985 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2986 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2987 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2988 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2989 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2990 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe ell-0.41-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_compile)
NOTE: recipe ell-0.41-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2992 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2993 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe ell-0.41-r0: task do_compile: Succeeded
NOTE: Running task 2996 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ell-0.41-r0: task do_install: Started
NOTE: recipe ell-0.41-r0: task do_install: Succeeded
NOTE: Running task 2997 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_populate_sysroot)
NOTE: Running task 2998 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2999 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 3000 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.41-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe ell-0.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_compile: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_compile_ptest_base)
NOTE: Running task 3002 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 3003 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe ell-0.41-r0: task do_package: Succeeded
NOTE: Running task 3004 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3005 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe ell-0.41-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 3006 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: Running task 3007 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe ell-0.41-r0: task do_packagedata: Succeeded
NOTE: Running task 3008 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.41.bb:do_package_write_rpm)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3009 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3010 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3011 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe ell-0.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 3012 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 3013 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3015 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3016 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3017 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3018 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3019 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_populate_sysroot)
NOTE: Running task 3020 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3021 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3022 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3023 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3025 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3026 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3027 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3028 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3029 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3030 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3031 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3032 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3033 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3034 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3035 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3036 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3037 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3038 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3039 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3040 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3041 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3042 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3044 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3045 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3046 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3047 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3048 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3050 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3051 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3052 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3053 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3054 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3055 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3056 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3057 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3058 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 3059 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 3061 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 3062 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 3063 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3064 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3065 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.59-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3066 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install)
NOTE: recipe bluez5-5.59-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3067 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe bluez5-5.59-r0: task do_install: Succeeded
NOTE: Running task 3068 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_install_ptest_base)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3069 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3070 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3071 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_populate_sysroot)
NOTE: Running task 3072 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package)
NOTE: recipe bluez5-5.59-r0: task do_package: Started
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.59-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3073 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3074 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3075 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3076 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3077 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3078 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_configure)
NOTE: recipe ofono-1.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3079 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3080 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.59-r0: task do_package: Succeeded
NOTE: Running task 3081 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_packagedata)
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Started
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
ERROR: bluez5-5.59-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.60-r0 to 0:5.59-r0) [version-going-backwards]
NOTE: recipe bluez5-5.59-r0: task do_packagedata: Succeeded
NOTE: Running task 3082 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.59.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3083 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3084 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_compile)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Started
NOTE: recipe ofono-1.32-r0: task do_configure: Succeeded
NOTE: Running task 3085 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_compile)
NOTE: recipe ofono-1.32-r0: task do_compile: Started
NOTE: recipe bluez5-5.59-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_install)
NOTE: recipe ofono-1.32-r0: task do_install: Started
NOTE: recipe ofono-1.32-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package)
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.32-r0: task do_package: Started
NOTE: recipe ofono-1.32-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3089 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3090 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3091 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_install)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3092 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3093 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3094 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3095 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_package: Succeeded
NOTE: Running task 3096 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.32-r0: task do_packagedata: Started
NOTE: recipe ofono-1.32-r0: task do_packagedata: Succeeded
NOTE: Running task 3097 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.32.bb:do_package_write_rpm)
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package: Succeeded
NOTE: Running task 3098 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3099 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3100 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb:do_package_write_rpm)
NOTE: Running task 3101 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 3102 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 3103 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 3104 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 3105 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3106 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3107 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3108 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3109 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_configure)
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 3110 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3111 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_compile: Succeeded
NOTE: Running task 3112 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3113 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Started
NOTE: recipe mpg123-1.28.1-r0: task do_configure: Succeeded
NOTE: Running task 3114 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_compile)
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3115 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb:do_package_write_rpm)
NOTE: Running task 3117 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.1-r0: task do_compile: Succeeded
NOTE: Running task 3118 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_install)
NOTE: recipe alsa-plugins-1.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_install: Started
NOTE: recipe mpg123-1.28.1-r0: task do_install: Succeeded
NOTE: Running task 3119 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package)
NOTE: Running task 3120 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.28.1-r0: task do_package: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.28.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package: Succeeded
NOTE: Running task 3121 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_packagedata)
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.28.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3122 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_write_rpm)
NOTE: Running task 3123 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_package_qa)
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.28.1-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3124 of 3124 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.28.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3124 tasks of which 2799 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============1053374030527869424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.28.0.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.28.1.tar.bz2"
packages/core2-32-poky-linux/mpg123: PKGV changed from 1.28.0 [default] to 1.28.1 [default]
packages/core2-32-poky-linux/mpg123: PV changed from "1.28.0" to "1.28.1"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.28.0 [default] to 1.28.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PV changed from "1.28.0" to "1.28.1"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2065948 to 2065732 (-0%)
packages/core2-32-poky-linux/mpg123/mpg123-dbg: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libsyn123.so.0.1.4 /usr/lib/libout123.so.0.4.1 /usr/lib/libmpg123.so.0.46.3"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.28.0 [default] to 1.28.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dev: PV changed from "1.28.0" to "1.28.1"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGSIZE changed from 178434 to 178887 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-dev: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libsyn123.so.0.1.4 /usr/lib/libout123.so.0.4.1 /usr/lib/libmpg123.so.0.46.3"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.28.0 [default] to 1.28.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-doc: PV changed from "1.28.0" to "1.28.1"
packages/core2-32-poky-linux/mpg123/mpg123-doc: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libsyn123.so.0.1.4 /usr/lib/libout123.so.0.4.1 /usr/lib/libmpg123.so.0.46.3"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.28.0 [default] to 1.28.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-locale: PV changed from "1.28.0" to "1.28.1"
packages/core2-32-poky-linux/mpg123/mpg123-locale: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libsyn123.so.0.1.4 /usr/lib/libout123.so.0.4.1 /usr/lib/libmpg123.so.0.46.3"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGV changed from 1.28.0 [default] to 1.28.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-src: PV changed from "1.28.0" to "1.28.1"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 2003300 to 2004128 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-src: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libsyn123.so.0.1.4 /usr/lib/libout123.so.0.4.1 /usr/lib/libmpg123.so.0.46.3"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.28.0 [default] to 1.28.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.28.0" to "1.28.1"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libsyn123.so.0.1.4 /usr/lib/libout123.so.0.4.1 /usr/lib/libmpg123.so.0.46.3"
packages/core2-32-poky-linux/mpg123/mpg123: PKGV changed from 1.28.0 [default] to 1.28.1 [default]
packages/core2-32-poky-linux/mpg123/mpg123: PV changed from "1.28.0" to "1.28.1"
packages/core2-32-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libsyn123.so.0.1.3 /usr/lib/libout123.so.0.4.0 /usr/lib/libmpg123.so.0.46.2", added "/usr/lib/libsyn123.so.0.1.4 /usr/lib/libout123.so.0.4.1 /usr/lib/libmpg123.so.0.46.3"
Changes to packages/core2-32-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.46.2 to libmpg123.so.0.46.3
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.46.2 to libmpg123.so.0.46.3
  /usr/lib/libout123.so.0 changed symlink target from libout123.so.0.4.0 to libout123.so.0.4.1
  /usr/lib/libout123.so changed symlink target from libout123.so.0.4.0 to libout123.so.0.4.1
  /usr/lib/libsyn123.so.0 changed symlink target from libsyn123.so.0.1.3 to libsyn123.so.0.1.4
  /usr/lib/libsyn123.so changed symlink target from libsyn123.so.0.1.3 to libsyn123.so.0.1.4
  /usr/lib/libmpg123.so.0.46.2 moved to /usr/lib/libmpg123.so.0.46.3
  /usr/lib/libout123.so.0.4.0 moved to /usr/lib/libout123.so.0.4.1
  /usr/lib/libsyn123.so.0.1.3 moved to /usr/lib/libsyn123.so.0.1.4

--===============1053374030527869424==--
