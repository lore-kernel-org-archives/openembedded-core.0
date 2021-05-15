Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.4691.1621074783939070372
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1DCC338C12BB
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.27.2 SUCCEEDED
Message-ID: <MADEUP.167F36EDD795737C.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151840
Content-Type: multipart/mixed; boundary="===============4145095999049031151=="

--===============4145095999049031151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.27.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.26.5-1.27.2.patch
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

--===============4145095999049031151==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.26.5-1.27.2.patch"

From dbff1475b7c888a8a38c462a158f7694ca3be682 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 09:02:12 +0000
Subject: [PATCH] mpg123: upgrade 1.26.5 -> 1.27.2

---
 .../mpg123/{mpg123_1.26.5.bb => mpg123_1.27.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.26.5.bb => mpg123_1.27.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb b/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
index 7207bd1dd0..9a91cc89d6 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.26.5.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "502a97e0d935be7e37d987338021d8f301bae35c2884f2a83d59c4b52466ef06"
+SRC_URI[sha256sum] = "52f6ceb962c05db0c043bb27acf5a721381f5f356ac4610e5221f50293891b04"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.27.0


--===============4145095999049031151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mpg123/mpg123-dev: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123-doc: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123-locale: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1642360 to 2050537 (+25%)
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
Changes to packages/core2-32-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.45.3 to libmpg123.so.0.46.1
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.45.3 to libmpg123.so.0.46.1
  /usr/lib/libout123.so.0 changed symlink target from libout123.so.0.3.0 to libout123.so.0.4.0
  /usr/lib/libout123.so changed symlink target from libout123.so.0.3.0 to libout123.so.0.4.0
  /usr/lib/libmpg123.so.0.45.3 moved to /usr/lib/libmpg123.so.0.46.1
  /usr/lib/libout123.so.0.3.0 moved to /usr/lib/libout123.so.0.4.0

--===============4145095999049031151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 121 Local 25 Network 0 Missed 96 Current 868 (20% match, 90% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 890 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 891 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 982 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 983 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 984 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1272 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_fetch)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1371 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: Running task 1398 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1399 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1447 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1497 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_unpack)
NOTE: Running task 1498 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: Running task 1607 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1621 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1622 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1647 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1691 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1692 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 1693 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1695 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1699 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1749 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running setscene task 986 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 1802 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1891 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 1896 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 1897 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 1922 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1923 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 1952 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running task 1974 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 1975 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 1976 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1985 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 1988 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_fetch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2003 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2025 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_patch)
NOTE: Running task 2036 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2125 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2126 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2127 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2128 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: Running task 2167 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Started
NOTE: Running task 2221 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2241 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: Running task 2250 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Succeeded
NOTE: Running task 2261 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: Running task 2262 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2269 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 2270 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_unpack)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe libogg-1.3.4-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2304 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2323 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe libogg-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2333 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: Running task 2334 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2390 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: Running task 2411 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: Running task 2412 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2463 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: Running task 2486 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2512 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2531 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2550 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: Running task 2559 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 2571 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: Running task 2604 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2649 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2650 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: Running task 2651 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 2652 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 988 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2663 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2667 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 2668 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 2669 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2672 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 2673 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2674 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: Running task 2675 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2676 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_patch)
NOTE: Running task 2677 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: Running task 2678 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: Running task 2679 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: Running task 2680 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: Running task 2681 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Running task 2682 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.4-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2695 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2696 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2697 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2698 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic)
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2699 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2700 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2701 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 2702 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 2703 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic unihash changed to 5451cef976f832a7104436b47199abf2018c3642bd434271cb19397bd9afcb36
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2704 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2705 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2706 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: Running task 2707 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: Running task 2708 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2709 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fdc085f12a4d811512eea39b42cb39da3075c7dd059d1ed45cec0a329ddedd03
NOTE: Running task 2755 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2770 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2803 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5cb53070dbb10dcbca6c781f2d0d18a10bbd606585db2df219cbfd8496662dbf
NOTE: Setscene tasks completed
NOTE: Running task 2856 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2863 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2864 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2865 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2866 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2868 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2869 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_compile)
NOTE: recipe libogg-1.3.4-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2871 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2872 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2873 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2874 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2875 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_install)
NOTE: recipe libogg-1.3.4-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2877 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 2878 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2879 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2880 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package)
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2881 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2882 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2883 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2884 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2885 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2886 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2887 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata)
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2888 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2889 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2890 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: Running task 2891 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2892 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 2893 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 2894 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2895 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2896 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2898 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2899 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2901 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2902 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: Running task 2903 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2904 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2905 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2906 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2907 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 2908 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2909 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 2910 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2911 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2913 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2914 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2915 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2916 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2917 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2918 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2919 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2921 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2922 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2923 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2924 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2925 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2926 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2927 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2928 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2929 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2930 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2931 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2932 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2933 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2935 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2936 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2937 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2938 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: Running task 2940 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2941 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2943 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2944 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2945 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2946 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2947 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2948 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2949 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: Running task 2950 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 2951 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 2952 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 2953 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 2954 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2955 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2956 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 2957 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 2958 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2959 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2960 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 2961 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 2963 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 2964 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2965 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2966 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2967 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2968 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2969 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2970 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2971 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 2973 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2974 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2975 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2976 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2977 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2978 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 2979 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 2980 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2983 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_compile)
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2985 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2986 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 2987 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Succeeded
NOTE: Running task 2988 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_install)
NOTE: recipe mpg123-1.27.2-r0: task do_install: Started
NOTE: recipe mpg123-1.27.2-r0: task do_install: Succeeded
NOTE: Running task 2989 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package)
NOTE: Running task 2990 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package: Succeeded
NOTE: Running task 2991 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_packagedata)
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2992 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_write_rpm)
NOTE: Running task 2993 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_qa)
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2994 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2994 tasks of which 2762 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============4145095999049031151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 111 Local 15 Network 0 Missed 96 Current 878 (13% match, 90% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 897 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1108 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1300 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_fetch)
NOTE: Running task 1399 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: Running task 1426 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1427 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1475 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1608 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_unpack)
NOTE: Running task 1609 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1673 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1690 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: Running task 1691 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1692 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1693 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1721 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1723 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1724 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1725 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1768 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1779 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1828 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: Running task 1939 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 1940 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: Running task 1975 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: Running task 1996 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 1997 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 1998 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2008 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 2011 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_fetch)
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 2013 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2040 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2041 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2042 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2150 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2151 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2152 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2153 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2580 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: Running task 2596 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 2610 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2611 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2612 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Succeeded
NOTE: Running task 2653 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_patch)
NOTE: Running task 2654 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2655 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 2656 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_unpack)
NOTE: Running task 2657 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: Running task 2658 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: Running task 2659 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2663 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2664 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2665 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2666 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2667 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: Running task 2668 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libogg-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2669 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: Running task 2670 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: Running task 2671 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2672 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: Running task 2673 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2674 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2675 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: Running task 2676 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: Running task 2677 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2678 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Succeeded
NOTE: Running task 2679 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2680 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2681 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2682 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 2683 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2684 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Started
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2685 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2686 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 2687 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2688 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2689 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_configure: Started
NOTE: Running task 2690 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2691 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Succeeded
NOTE: Running task 2692 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2693 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2694 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: Running task 2695 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2696 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: Running task 2697 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2698 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2699 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2700 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2701 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2702 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2703 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic unihash changed to 5451cef976f832a7104436b47199abf2018c3642bd434271cb19397bd9afcb36
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: Running task 2704 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2705 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 2706 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dfc85dadf1206a4718fcd43404d130a7b709788edf0b6c43786e4dda281f1a9e
NOTE: Running task 2752 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2767 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2800 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2801 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2802 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2803 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 061780a75f7483885c15732173b5f425eb7788983e95873c1e812fae0568b1c3
NOTE: Setscene tasks completed
NOTE: Running task 2857 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2863 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: Running task 2864 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2865 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2866 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2868 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2869 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_compile)
NOTE: recipe libogg-1.3.4-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2871 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2872 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2874 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 2875 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: Running task 2877 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.4-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2878 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2879 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2880 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package)
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2881 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2882 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2883 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2884 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2885 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2886 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 2887 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe libogg-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2888 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata)
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2889 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 2890 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 2891 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2892 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2893 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2894 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2895 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2896 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2897 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2898 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2899 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2900 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2901 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2902 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2903 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 2904 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2905 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2906 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 2907 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2908 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2909 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2910 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2911 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2913 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2914 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2915 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2916 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2917 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2918 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2919 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2921 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2922 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2923 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2924 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2925 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2926 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2927 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2928 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2929 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2930 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2931 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2932 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2933 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2935 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2936 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2937 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2938 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2940 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2941 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2943 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2944 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2945 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2946 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2947 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 2948 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2949 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2950 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2951 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 2952 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 2953 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 2954 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2955 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2956 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2957 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: Running task 2958 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 2959 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 2960 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 2961 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2963 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: Running task 2964 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 2965 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 2966 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2967 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2968 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2969 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2970 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2971 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2973 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2974 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 2975 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2976 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2977 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2978 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 2979 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 2980 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2983 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_compile)
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2985 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2986 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 2987 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Succeeded
NOTE: Running task 2988 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_install)
NOTE: recipe mpg123-1.27.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_install: Succeeded
NOTE: Running task 2989 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package)
NOTE: Running task 2990 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package: Succeeded
NOTE: Running task 2991 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_packagedata)
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2992 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_write_rpm)
NOTE: Running task 2993 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_qa)
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2994 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2994 tasks of which 2762 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============4145095999049031151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 154 recipes from the core2-32 sysroot...done.
Removing 158 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 766 Local 669 Network 0 Missed 97 Current 230 (87% match, 90% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 232 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ell-0.40-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 294 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe ell-0.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 301 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 305 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.105.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 331 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 341 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 342 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.105-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_21.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 355 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 357 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 359 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 363 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 364 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.105-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 370 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 412 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 466 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 469 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 475 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 484 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 485 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 486 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 487 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 489 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 490 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 491 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 504 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 505 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 506 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bluez5-5.58-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.40-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 513 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 519 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 520 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 521 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 522 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 523 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 524 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 525 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 526 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 527 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2021.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 534 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 539 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 543 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ell-0.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 544 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 546 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 561 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 564 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 567 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 572 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 575 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 576 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 581 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 583 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20201225-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 597 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 675 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_fetch)
NOTE: recipe bluez5-5.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 696 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: Running task 700 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 701 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 703 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: Running task 754 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 763 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 765 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 766 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 767 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 812 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 820 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 860 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: Running task 872 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 875 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_fetch)
NOTE: Running task 888 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: Running task 921 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe libical-3.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 950 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 951 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 952 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 962 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 988 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Started
NOTE: Running task 989 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: Running setscene task 631 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 633 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running setscene task 636 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1005 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 1006 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 1007 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 1008 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 1009 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 1012 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 1014 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_unpack)
NOTE: Running task 1015 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1071 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 1072 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Started
NOTE: Running task 1095 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: Running setscene task 645 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1096 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: Running task 1122 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1218 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 651 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1228 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: Running task 1234 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1235 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: Running task 1241 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.105.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running task 1250 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 676 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe icu-69.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running task 1264 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 682 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: Running setscene task 684 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running task 1277 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 1278 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: Running task 1279 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1280 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.105-r0: task do_packagedata_setscene: Started
NOTE: Running task 1281 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1282 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1283 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_patch)
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1284 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 1285 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe libogg-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1286 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: Running task 1287 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: Running task 1288 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: Running task 1289 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running setscene task 691 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Started
NOTE: Running task 1290 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: Running task 1291 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1296 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1297 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: Running task 1322 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.105-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1323 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1324 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: Running setscene task 716 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: Running task 1330 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1339 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1340 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 1341 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1342 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic)
NOTE: Running task 1343 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1349 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1350 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 723 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1355 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 732 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 739 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic unihash changed to 5451cef976f832a7104436b47199abf2018c3642bd434271cb19397bd9afcb36
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 765 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1419 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 789 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 793 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 806 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running setscene task 807 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1430 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 815 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running task 1436 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 820 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1440 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 826 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 834 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 838 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1477 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 847 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 854 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running setscene task 857 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1491 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 862 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 865 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 874 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running setscene task 879 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1503 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1535 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 888 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 909 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 912 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 914 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 917 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 920 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 922 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 923 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 924 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 927 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 929 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 930 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 931 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 935 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 936 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1601 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 946 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 949 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 952 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 954 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 960 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 961 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1634 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 965 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 966 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e26bb56718bc9073a8415f8e3429c9bc0634b7262f81b3677d8b04efe3b0e42e
NOTE: Running task 1643 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 972 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 983 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 994 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 996 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 996 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1969 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2094 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2162 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2328 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2343 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2344 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2532 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2721 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2722 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2723 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to da088cd7bf30f5b51b1d8cf49e4c6e94b8f6555cc499362ca0e7788d7be5a873
NOTE: recipe libogg-1.3.4-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2771 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: Running task 2772 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 2774 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: Running task 2804 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: Running task 2831 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2870 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2871 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2872 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2873 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2874 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2875 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2876 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2877 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2878 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_compile)
NOTE: recipe libogg-1.3.4-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2879 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2880 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2881 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2882 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libogg-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2883 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2884 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 2885 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe libogg-1.3.4-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe libogg-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2886 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2887 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package)
NOTE: recipe libogg-1.3.4-r0: task do_package: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2888 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2889 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2890 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2891 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2892 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2893 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2894 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2895 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2896 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2897 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata)
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 2898 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2899 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2901 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 2902 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 2903 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2904 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2905 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2906 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2907 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2908 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2909 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2911 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2912 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2913 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 2914 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2915 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2916 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2917 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: Running task 2918 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2919 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2920 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2921 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2922 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2923 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2924 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2925 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2926 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2927 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2928 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2929 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2930 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2931 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2932 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2933 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2935 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2936 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2937 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2938 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2940 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2941 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2943 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2944 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2945 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2946 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2947 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2948 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2949 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: Running task 2950 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2951 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2952 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2953 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2954 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2955 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2956 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2957 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 2958 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2959 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2960 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2961 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 2962 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 2963 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 2964 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2965 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2966 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2967 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: Running task 2968 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 2969 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 2970 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 2971 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2973 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2974 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: Running task 2975 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 2976 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2977 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2978 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2979 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2980 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2981 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2983 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 2985 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2986 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2987 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2988 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 2989 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 2990 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2992 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2993 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_compile)
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2995 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2996 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 2997 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Succeeded
NOTE: Running task 2998 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_install: Started
NOTE: recipe mpg123-1.27.2-r0: task do_install: Succeeded
NOTE: Running task 2999 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package)
NOTE: Running task 3000 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package: Succeeded
NOTE: Running task 3001 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_packagedata)
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3002 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_write_rpm)
NOTE: Running task 3003 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_qa)
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3004 of 3004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_build)
NOTE: Tasks Summary: Attempted 3004 tasks of which 2766 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============4145095999049031151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 119 Local 23 Network 0 Missed 96 Current 870 (19% match, 90% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 892 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1272 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_fetch)
NOTE: Running task 1371 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: Running task 1398 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1399 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1447 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_unpack)
NOTE: Running task 1551 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1634 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: Running task 1635 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1645 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 986 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: Running task 1654 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1655 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1695 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1696 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1698 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: Running task 1699 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1743 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1753 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: Running task 1802 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1906 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 1907 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 1949 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: Running task 1961 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: Running task 1962 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 1963 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 1982 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: Running task 1985 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_fetch)
NOTE: Running task 1989 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 1990 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2030 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: Running task 2031 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2035 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2124 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2125 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: Running task 2126 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2127 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 2420 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2421 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 2423 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: Running task 2424 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: Running task 2425 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2455 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_patch)
NOTE: Running task 2456 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2457 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: Running task 2458 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_unpack)
NOTE: Running task 2459 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: Running task 2460 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2570 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: Running task 2580 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: Running task 2599 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: Running task 2614 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2640 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: Running task 2641 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: recipe libogg-1.3.4-r0: task do_patch: Started
NOTE: Running task 2642 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2643 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2644 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: Running task 2645 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: Running task 2646 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: Running task 2647 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 2648 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2649 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2650 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 988 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: Running task 2661 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: Running task 2666 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2667 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2668 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2669 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2670 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2671 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: Running task 2672 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: Running task 2673 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2674 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_patch)
NOTE: Running task 2675 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: Running task 2676 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: Running task 2677 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: Running task 2678 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2680 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Running task 2681 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.4-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2694 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2695 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2696 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2697 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2698 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic)
NOTE: Running task 2699 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2700 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2701 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2702 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2703 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic unihash changed to 5451cef976f832a7104436b47199abf2018c3642bd434271cb19397bd9afcb36
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2704 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2705 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2706 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2707 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2708 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2709 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65bc2a999d0249cb2ac560c03e36a22609b1ba46f75d58326fd303d12a9c2adc
NOTE: Running task 2755 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2770 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2803 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 185fae5bf3ad4b72e8f86b78c04c5d7744ac78cbbc043d6773f94805f81a53c8
NOTE: Setscene tasks completed
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2840 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: Running task 2857 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2864 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: Running task 2865 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2866 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2868 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2869 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2870 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2871 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2872 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2873 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libogg-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2874 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2875 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.4-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 2876 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2877 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libogg-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2878 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2879 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2880 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2881 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2882 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2883 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2884 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2885 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2886 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 2887 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2888 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2889 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2890 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 2891 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 2892 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2893 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm)
NOTE: Running task 2894 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2895 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2896 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2898 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2899 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2901 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2902 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2903 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 2904 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2905 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2906 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 2907 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: Running task 2908 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2909 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2910 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2911 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2913 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2914 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2915 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2916 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2917 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2918 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2919 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2921 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2922 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2923 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2924 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2925 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2926 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2927 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2928 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2929 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2930 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2931 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2932 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2933 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2935 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2936 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2937 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2938 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: Running task 2940 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2941 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2943 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2944 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2945 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2946 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2947 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2948 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2949 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 2950 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2951 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 2952 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 2953 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 2954 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2955 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2956 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 2957 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2959 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: Running task 2960 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: Running task 2961 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 2963 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 2964 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2965 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: Running task 2966 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2967 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2968 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2969 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_configure)
NOTE: Running task 2970 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 2971 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: Running task 2973 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2974 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2975 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2976 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2977 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2978 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 2979 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 2980 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2983 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_compile)
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2985 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2986 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 2987 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Succeeded
NOTE: Running task 2988 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_install)
NOTE: recipe mpg123-1.27.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_install: Succeeded
NOTE: Running task 2989 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package)
NOTE: Running task 2990 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package: Succeeded
NOTE: Running task 2991 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_packagedata)
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2992 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_write_rpm)
NOTE: Running task 2993 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_qa)
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2994 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2994 tasks of which 2762 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============4145095999049031151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d03860bd44fc3a59ba44e2c54e2c17c8d224acf"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 119 Local 23 Network 0 Missed 96 Current 870 (19% match, 90% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 892 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 984 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1272 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_fetch)
NOTE: Running task 1371 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: Running task 1398 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: Running task 1399 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1447 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1577 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_unpack)
NOTE: Running task 1578 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1643 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1656 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1657 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1658 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: Running task 1659 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1695 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1696 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: Running task 1697 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1699 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1737 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: Running task 1753 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1802 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: Running task 1893 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 1896 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: Running task 1949 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_fetch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: Running task 1979 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_write_config)
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1982 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_fetch)
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: Running task 1997 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: Running task 2014 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 2030 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: Running task 2043 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
NOTE: Running task 2044 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 2083 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2084 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: Running task 2085 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2124 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: Running task 2125 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 2126 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: Running task 2127 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_patch)
NOTE: Running task 2128 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.112-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_fetch: Succeeded
NOTE: Running task 2218 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_unpack)
NOTE: Running task 2226 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: Running task 2227 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: Running task 2250 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2308 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2351 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_write_config: Succeeded
NOTE: Running task 2365 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2366 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2367 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: Running task 2368 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: Running task 2388 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2389 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: Running task 2390 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2407 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: Running task 2408 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: Running task 2478 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_unpack: Succeeded
NOTE: Running task 2492 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: Running task 2508 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 988 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2543 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2547 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2548 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2549 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2550 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: Running task 2552 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: Running task 2553 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_patch)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2555 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2556 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2557 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2558 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_patch)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: Running task 2559 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: Running task 2560 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: Running task 2561 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2562 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: Running task 2563 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: Running task 2564 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe dbus-glib-0.112-r0: task do_patch: Succeeded
NOTE: Running task 2575 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.4-r0: task do_configure: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Started
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: Running task 2677 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Setscene tasks completed
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2690 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2691 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 2692 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2693 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2694 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2695 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2696 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 2697 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2698 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.112-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2699 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-14.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Started
NOTE: Running task 2700 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 2701 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2702 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_lic unihash changed to 5451cef976f832a7104436b47199abf2018c3642bd434271cb19397bd9afcb36
NOTE: recipe mpg123-1.27.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2703 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 2704 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2705 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2706 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2707 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2708 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2709 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3efc4f5e67f95cd8a1a7756b3c20cad69a0ca7af90542ea68811d9f5bb3f5e72
NOTE: Running task 2755 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2770 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2803 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6d0e6e66a0affae81c0be3ba3f3e6c5aaac827a3f69de942bd3e101e3df77be5
NOTE: Setscene tasks completed
NOTE: Running task 2856 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2863 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2864 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe dbus-glib-0.112-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2865 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2866 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2868 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2869 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_compile)
NOTE: recipe libogg-1.3.4-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2871 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2872 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2874 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libogg-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2875 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_install)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2876 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.4-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 2877 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: recipe libogg-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2878 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2879 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package)
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2880 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2881 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2882 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2883 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2884 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2885 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2886 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2887 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 2888 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: Running task 2889 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2890 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 2891 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 2892 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2893 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2894 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2895 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2896 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_compile)
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2898 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2899 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_install)
NOTE: recipe dbus-glib-0.112-r0: task do_install: Started
NOTE: recipe dbus-glib-0.112-r0: task do_install: Succeeded
NOTE: Running task 2901 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package)
NOTE: Running task 2902 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_populate_sysroot)
NOTE: recipe dbus-glib-0.112-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.112-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2903 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2904 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 2905 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
ERROR: ofono-1.31-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:1.32-r0 to 0:1.31-r0) [version-going-backwards]
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: Running task 2906 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2907 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2908 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 2909 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package: Succeeded
NOTE: Running task 2910 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_packagedata)
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.112-r0: task do_packagedata: Succeeded
NOTE: Running task 2912 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.112.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.112-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2913 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2914 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2915 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2916 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2917 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2918 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2919 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2921 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2922 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2923 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2924 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 2925 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2926 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2927 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2928 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 2929 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2930 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2931 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2932 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 2933 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 2935 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 2936 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2937 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2938 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: Running task 2940 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 2941 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2943 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2944 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2945 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2946 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2947 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 2948 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2949 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2950 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package_write_rpm)
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2951 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_configure)
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Started
NOTE: recipe sbc-1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 2952 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 2953 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 2954 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2955 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2956 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2957 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2958 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 2959 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 2960 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_configure: Succeeded
NOTE: Running task 2961 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_compile)
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_install)
NOTE: recipe pulseaudio-14.2-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2963 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: Running task 2964 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.2-r0: task do_install: Succeeded
NOTE: Running task 2965 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package)
NOTE: Running task 2966 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2967 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2968 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.27.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2969 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2970 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2971 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2972 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2973 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package: Succeeded
NOTE: Running task 2974 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_packagedata)
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2975 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2976 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2977 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2978 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 2979 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 2980 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2983 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_compile)
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2985 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2986 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 2987 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_compile: Succeeded
NOTE: Running task 2988 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_install)
NOTE: recipe mpg123-1.27.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_install: Succeeded
NOTE: Running task 2989 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package)
NOTE: Running task 2990 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.27.2-r0: task do_package: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.27.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package: Succeeded
NOTE: Running task 2991 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_packagedata)
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.27.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2992 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_write_rpm)
NOTE: Running task 2993 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_package_qa)
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Started
NOTE: recipe mpg123-1.27.2-r0: task do_package_qa: Succeeded
NOTE: recipe mpg123-1.27.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2994 of 2994 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2994 tasks of which 2762 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============4145095999049031151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpg123: PV changed from "1.26.5" to "1.27.2"
packages/core2-32-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.26.5.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.27.2.tar.bz2"
packages/core2-32-poky-linux/mpg123: PKGV changed from 1.26.5 [default] to 1.27.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PV changed from "1.26.5" to "1.27.2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2029072 to 2065140 (+2%)
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.26.5 [default] to 1.27.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dbg: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PV changed from "1.26.5" to "1.27.2"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGSIZE changed from 163655 to 177787 (+9%)
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.26.5 [default] to 1.27.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dev: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PV changed from "1.26.5" to "1.27.2"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGSIZE changed from 40053 to 40495 (+1%)
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.26.5 [default] to 1.27.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-doc: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PV changed from "1.26.5" to "1.27.2"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.26.5 [default] to 1.27.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-locale: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123-src: PV changed from "1.26.5" to "1.27.2"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1642360 to 2050537 (+25%)
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGV changed from 1.26.5 [default] to 1.27.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-src: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.26.5" to "1.27.2"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.26.5 [default] to 1.27.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
packages/core2-32-poky-linux/mpg123/mpg123: PV changed from "1.26.5" to "1.27.2"
packages/core2-32-poky-linux/mpg123/mpg123: PKGSIZE changed from 986411 to 1039739 (+5%)
packages/core2-32-poky-linux/mpg123/mpg123: PKGV changed from 1.26.5 [default] to 1.27.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libout123.so.0.3.0 /usr/lib/libmpg123.so.0.45.3", added "/usr/lib/libmpg123.so.0.46.1 /usr/lib/libout123.so.0.4.0"
Changes to packages/core2-32-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.45.3 to libmpg123.so.0.46.1
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.45.3 to libmpg123.so.0.46.1
  /usr/lib/libout123.so.0 changed symlink target from libout123.so.0.3.0 to libout123.so.0.4.0
  /usr/lib/libout123.so changed symlink target from libout123.so.0.3.0 to libout123.so.0.4.0
  /usr/lib/libmpg123.so.0.45.3 moved to /usr/lib/libmpg123.so.0.46.1
  /usr/lib/libout123.so.0.3.0 moved to /usr/lib/libout123.so.0.4.0

--===============4145095999049031151==--
