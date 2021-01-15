Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.699.1610713822295169849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id CCEA038C1192
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcap: upgrading to 1.10.0 SUCCEEDED
Message-ID: <MADEUP.165A67B009718586.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146745
Content-Type: multipart/mixed; boundary="===============8970490060355578458=="

--===============8970490060355578458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcap* to *1.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcap-upgrade-1.9.1-1.10.0.patch
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

--===============8970490060355578458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpcap/libpcap-dev: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-doc: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-locale: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
Changes to packages/core2-32-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.9.1 to libpcap.so.1.10.0
  /usr/lib/libpcap.so.1.10.0 was added
  /usr/lib/libpcap.so.1.9.1 was removed

--===============8970490060355578458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1421 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-b93c988940d0863d2f8b3c7860f1a68acc814769"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93c988940d0863d2f8b3c7860f1a68acc814769"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 129 Found 5 Missed 124 Current 659 (3% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 661 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 677 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 786 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: Running task 1086 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1244 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1251 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1257 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_fetch)
NOTE: Running task 1261 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_fetch)
NOTE: Running task 1285 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_fetch)
NOTE: Running task 1289 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1292 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_fetch)
NOTE: Running task 1315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 1316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_fetch)
NOTE: Running task 1342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_fetch)
NOTE: Running task 1395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libical-3.0.8-r0: task do_fetch: Started
NOTE: Running task 1480 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_write_config)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe icu-68.2-r0: task do_fetch: Started
NOTE: Running task 1511 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1512 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1513 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1514 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_unpack)
NOTE: Running task 1515 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-68.2-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: Running task 1516 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_unpack)
NOTE: Running task 1517 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_unpack)
NOTE: Running task 1518 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1519 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: Running task 1520 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1521 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1522 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1523 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_unpack)
NOTE: Running task 1524 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1525 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1526 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1527 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: Running task 1528 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1529 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1530 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Started
NOTE: Running task 1531 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1532 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1533 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: Running task 1534 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1535 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_unpack)
NOTE: Running task 1542 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_write_config)
NOTE: Running task 1543 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1544 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Started
NOTE: Running task 1545 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe icu-68.2-r0: task do_unpack: Started
NOTE: Running task 1566 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1588 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Started
NOTE: Running task 1598 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe bluez5-5.55-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1615 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1639 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: Running task 1652 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1668 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 1723 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1724 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: Running task 1732 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_write_config)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1751 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_unpack)
NOTE: Running task 1758 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe libical-3.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Started
NOTE: Running task 1767 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_patch)
NOTE: Running task 1768 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: Running task 1808 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1819 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_unpack)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Started
NOTE: Running task 1904 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 1918 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1937 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libical-3.0.8-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: Running task 1938 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1949 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 1958 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1959 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_write_config)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Started
NOTE: Running task 1970 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 2051 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_patch)
NOTE: Running task 2060 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running task 2069 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: Running task 2134 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Started
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: Running task 2151 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2173 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: Running task 2174 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Started
NOTE: Running task 2175 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2176 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Succeeded
NOTE: Running task 2177 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2178 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 2179 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe bluez5-5.55-r0: task do_unpack: Succeeded
NOTE: Running task 2180 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_patch)
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.8-r0: task do_patch: Succeeded
NOTE: Running task 2181 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_generate_toolchain_file)
NOTE: Running task 2182 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2183 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2184 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 2185 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2187 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_patch: Started
NOTE: Running task 2188 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2189 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2190 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2191 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2192 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: Running task 2193 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 2194 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_patch: Succeeded
NOTE: Running task 2195 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2196 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2197 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2198 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic unihash changed to 591f691de0b952b674970a419d03d123b4ef2c9c6b6e6786694ca8823f69e220
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2199 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d4041a4a48affaafca05a5e4c3d93c77aa466a8c7d00d8d9ab20e5262d434f0f
NOTE: Running task 2222 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2223 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2233 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2244 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2245 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-68.2-r0: task do_unpack: Succeeded
NOTE: Running task 2246 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0f9421dca25c576b826474b0e95dade406781e1c7de20748017962073d574ad4
NOTE: Setscene tasks completed
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2249 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_patch)
NOTE: Running task 2264 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-68.2-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2278 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2279 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2280 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.2-r0: task do_patch: Succeeded
NOTE: Running task 2281 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_make_icudata)
NOTE: Running task 2282 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2283 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2284 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe icu-68.2-r0: task do_make_icudata: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2285 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: Running task 2286 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-68.2-r0: task do_make_icudata: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2289 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_configure)
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_configure: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2294 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_configure: Succeeded
NOTE: Running task 2295 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_compile)
NOTE: recipe icu-68.2-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2296 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 2297 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2298 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 2300 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2301 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2302 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2303 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 2305 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: Running task 2306 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 2307 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2308 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2309 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2310 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2311 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2312 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2313 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2321 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2322 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2323 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2324 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2327 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2328 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2330 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 2331 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_compile)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Succeeded
NOTE: Running task 2333 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata)
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2334 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2335 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2339 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2340 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libdrm-2.4.103-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2348 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libdrm-2.4.103-r0: task do_install: Succeeded
NOTE: Running task 2349 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot)
NOTE: Running task 2350 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package: Succeeded
NOTE: Running task 2351 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_compile)
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Succeeded
NOTE: Running task 2353 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_install)
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2360 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2361 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: Running task 2363 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2364 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2365 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2366 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2367 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: Running task 2369 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2370 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2372 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: Running task 2374 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2375 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2376 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2377 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2378 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2380 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2381 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2384 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2385 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2386 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2389 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2391 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_configure)
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2397 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe icu-68.2-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe icu-68.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_install: Succeeded
NOTE: Running task 2401 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot)
NOTE: Running task 2402 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package)
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_package: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2403 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2405 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_configure)
NOTE: recipe libical-3.0.8-r0: task do_configure: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_compile)
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2408 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2410 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe icu-68.2-r0: task do_package: Succeeded
NOTE: Running task 2411 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata)
NOTE: recipe icu-68.2-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_compile)
NOTE: recipe libical-3.0.8-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2413 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm)
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_install)
NOTE: recipe libical-3.0.8-r0: task do_install: Started
NOTE: recipe libical-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 2416 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package)
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2417 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure)
NOTE: recipe bluez5-5.55-r0: task do_configure: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata)
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2422 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile)
NOTE: recipe bluez5-5.55-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2424 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install)
NOTE: recipe bluez5-5.55-r0: task do_install: Started
NOTE: recipe bluez5-5.55-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2426 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package)
NOTE: Running task 2427 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_package: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2428 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2429 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_configure)
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_install)
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Started
NOTE: recipe bluez5-5.55-r0: task do_package: Succeeded
NOTE: Running task 2431 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata)
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package)
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2434 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_compile)
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Started
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_install)
NOTE: recipe libpcap-1.10.0-r0: task do_install: Started
NOTE: recipe libpcap-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package)
NOTE: Running task 2439 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_package: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_packagedata)
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_write_rpm)
NOTE: Running task 2442 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_qa)
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Succeeded
NOTE: Running task 2443 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2444 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm)
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2445 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2448 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2449 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2450 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 2452 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_install)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package)
NOTE: Running task 2456 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2457 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2459 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2460 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_compile)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_install)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2464 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2466 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2467 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2467 tasks of which 2162 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============8970490060355578458==
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
DISTRO_VERSION       = "3.2+snapshot-b93c988940d0863d2f8b3c7860f1a68acc814769"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93c988940d0863d2f8b3c7860f1a68acc814769"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 129 Found 5 Missed 124 Current 659 (3% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 661 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 677 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 786 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1086 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1244 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1251 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1257 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_fetch)
NOTE: Running task 1261 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_fetch)
NOTE: Running task 1285 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_fetch)
NOTE: Running task 1289 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1292 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_fetch)
NOTE: Running task 1315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 1341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_fetch)
NOTE: Running task 1394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_fetch)
NOTE: Running task 1454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Started
NOTE: recipe libical-3.0.8-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: Running task 1480 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_write_config)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1487 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe bluez5-5.55-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1488 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1489 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_unpack)
NOTE: Running task 1490 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1491 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_unpack)
NOTE: Running task 1492 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe icu-68.2-r0: task do_fetch: Started
NOTE: Running task 1493 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1494 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1495 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1496 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-68.2-r0: task do_fetch: Succeeded
NOTE: Running task 1497 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_unpack)
NOTE: Running task 1498 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: Running task 1499 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_unpack)
NOTE: Running task 1500 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1501 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1502 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Succeeded
NOTE: Running task 1503 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1504 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1505 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1506 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1507 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1508 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1509 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1510 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Started
NOTE: recipe libical-3.0.8-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: Running task 1519 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_unpack)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_unpack: Started
NOTE: Running task 1520 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1543 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1544 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Started
NOTE: Running task 1545 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: Running task 1546 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_write_config)
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_fetch)
NOTE: Running task 1568 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: Running task 1571 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_patch)
NOTE: recipe libical-3.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1589 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_patch)
NOTE: Running task 1592 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1618 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_fetch)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1665 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: Running task 1674 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1675 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1707 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1727 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_fetch)
NOTE: Running task 1728 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: Running task 1736 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_write_config)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 1741 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1762 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1767 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe libical-3.0.8-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: Running task 1775 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 1796 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1802 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: Running task 1803 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: Running task 1817 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Succeeded
NOTE: Running task 1826 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_patch)
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1832 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_unpack)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: Running task 1870 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_unpack)
NOTE: Running task 1871 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1955 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Started
NOTE: Running task 1964 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_write_config)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: Running task 2098 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2117 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2118 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_patch)
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2144 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Started
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Started
NOTE: Running task 2165 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: Running task 2179 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: Running task 2180 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.55-r0: task do_patch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: Running task 2181 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.8-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2182 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_generate_toolchain_file)
NOTE: Running task 2183 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2185 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_patch: Succeeded
NOTE: Running task 2186 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 2187 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2188 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2189 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic)
NOTE: Running task 2190 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2191 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2192 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2193 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2194 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: Running task 2195 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: Running task 2196 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2197 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2198 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic unihash changed to 591f691de0b952b674970a419d03d123b4ef2c9c6b6e6786694ca8823f69e220
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2199 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 2200 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2201 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2203 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2204 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 37b13c2fd369d8f1cbb30d7498e8ed15c2aa31eab2163136d11ca50fb4715ab0
NOTE: Running task 2227 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2228 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: Running task 2238 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2249 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2250 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2251 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: Running task 2252 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2253 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe icu-68.2-r0: task do_unpack: Succeeded
NOTE: Running task 2254 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_patch)
NOTE: recipe icu-68.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2f87c1f8835bea5fb54c2522c9fffb8ea62a07ad29d07add5b6484f22177419
NOTE: Setscene tasks completed
NOTE: Running task 2271 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2284 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe icu-68.2-r0: task do_patch: Succeeded
NOTE: Running task 2285 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_make_icudata)
NOTE: Running task 2286 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2287 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_make_icudata: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_make_icudata: Succeeded
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2288 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_configure)
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2289 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2290 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: Running task 2293 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2294 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2295 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2297 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-68.2-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe icu-68.2-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2300 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2301 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot)
NOTE: Running task 2308 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2309 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2310 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Started
NOTE: Running task 2311 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 2313 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 2314 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2317 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2325 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2326 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2330 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2331 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2332 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2333 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2335 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: Running task 2338 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2339 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2340 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2347 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_install)
NOTE: recipe libdrm-2.4.103-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_install: Succeeded
NOTE: Running task 2349 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot)
NOTE: Running task 2350 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_compile)
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Succeeded
NOTE: Running task 2354 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_install)
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2360 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2362 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2364 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2368 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2372 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2373 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: Running task 2374 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2375 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2376 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2380 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2385 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm)
NOTE: Running task 2386 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2389 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2390 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2391 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_install)
NOTE: recipe icu-68.2-r0: task do_install: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_configure)
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot)
NOTE: Running task 2401 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package)
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_package: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2404 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_configure)
NOTE: recipe libical-3.0.8-r0: task do_configure: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_compile)
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe icu-68.2-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata)
NOTE: recipe icu-68.2-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_compile)
NOTE: recipe libical-3.0.8-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2409 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm)
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2411 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2412 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2413 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.8-r0: task do_install: Started
NOTE: recipe libical-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 2416 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package)
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2417 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure)
NOTE: recipe bluez5-5.55-r0: task do_configure: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata)
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2422 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile)
NOTE: recipe bluez5-5.55-r0: task do_compile: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_install)
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Started
NOTE: recipe bluez5-5.55-r0: task do_compile: Succeeded
NOTE: Running task 2424 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot)
NOTE: Running task 2426 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package)
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2427 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2428 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Succeeded
NOTE: Running task 2429 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2431 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install)
NOTE: recipe bluez5-5.55-r0: task do_install: Started
NOTE: recipe bluez5-5.55-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2433 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package)
NOTE: Running task 2434 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_package: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2435 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2436 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_configure)
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_package: Succeeded
NOTE: Running task 2437 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2438 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2439 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_compile)
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Started
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2440 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_install)
NOTE: recipe libpcap-1.10.0-r0: task do_install: Started
NOTE: recipe libpcap-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2441 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package)
NOTE: Running task 2442 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_package: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2443 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_packagedata)
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2444 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_write_rpm)
NOTE: Running task 2445 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_qa)
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2448 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2449 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2450 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2452 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_install)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package)
NOTE: Running task 2456 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2457 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2459 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2460 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_compile)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_install)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2464 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2466 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2467 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2467 tasks of which 2162 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============8970490060355578458==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libpcap-upgrade-1.9.1-1.10.0.patch"

From 1f57dc8905b5f7e99a61357700907eda80cda0e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 03:29:40 +0000
Subject: [PATCH] libpcap: upgrade 1.9.1 -> 1.10.0

---
 .../libpcap/{libpcap_1.9.1.bb => libpcap_1.10.0.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.9.1.bb => libpcap_1.10.0.bb} (92%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
similarity index 92%
rename from meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
index 35bb5650b3..e777573872 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.9.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb
@@ -12,8 +12,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[md5sum] = "21af603d9a591c7d96a6457021d84e6c"
-SRC_URI[sha256sum] = "635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094"
+SRC_URI[sha256sum] = "8d12b42623eeefee872f123bd0dc85d535b00df4d42e865f993c40f7bfc92b1e"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.27.0


--===============8970490060355578458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 43 skipped, 0 masked, 0 errors.
Removing 114 recipes from the core2-32 sysroot...done.
Removing 118 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-b93c988940d0863d2f8b3c7860f1a68acc814769"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93c988940d0863d2f8b3c7860f1a68acc814769"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 586 Found 461 Missed 125 Current 213 (78% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 215 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 296 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 297 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 335 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 364 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 394 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 395 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 397 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 398 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 400 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 403 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 409 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 410 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 411 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 412 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 414 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 415 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 416 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 420 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 421 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 422 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 432 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 433 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 434 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 438 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 439 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 442 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 443 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 444 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 445 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 448 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 449 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 457 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 460 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 461 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 464 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: Running setscene task 469 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 475 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: Running task 662 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 663 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 665 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_fetch)
NOTE: Running task 666 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_fetch)
NOTE: Running task 670 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_fetch)
NOTE: Running task 671 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 672 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_fetch)
NOTE: Running task 677 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 678 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 683 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 684 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 685 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_fetch)
NOTE: Running task 686 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 687 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 688 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 707 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 708 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 709 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_fetch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 732 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 737 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_write_config)
NOTE: Running task 760 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 761 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_write_config)
NOTE: Running task 764 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_fetch)
NOTE: Running task 773 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 785 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_fetch)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 833 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: Running task 834 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_fetch)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Started
NOTE: Running task 840 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe libical-3.0.8-r0: task do_fetch: Started
NOTE: recipe icu-68.2-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Started
NOTE: recipe bluez5-5.55-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 845 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 846 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 493 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: Running task 847 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe icu-68.2-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 848 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 849 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 850 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_unpack)
NOTE: Running task 851 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_unpack)
NOTE: Running task 852 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_unpack)
NOTE: Running task 853 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 854 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: Running task 855 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 856 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 857 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_unpack)
NOTE: Running task 858 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 859 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 860 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 861 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 862 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_unpack)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running task 863 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 864 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_unpack)
NOTE: Running task 865 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: Running task 866 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_unpack)
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Succeeded
NOTE: Running task 906 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: Running task 907 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running task 961 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libical-3.0.8-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe icu-68.2-r0: task do_unpack: Started
NOTE: recipe bluez5-5.55-r0: task do_fetch: Succeeded
NOTE: Running task 1006 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_unpack)
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Started
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: Running setscene task 496 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1011 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: Running task 1012 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1013 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: Running task 1014 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_unpack: Started
NOTE: Running task 1015 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1016 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Started
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 1029 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: Running task 1030 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1031 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 1032 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Started
NOTE: Running task 1034 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 1035 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1037 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1038 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1039 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 504 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1051 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: Running task 1052 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1053 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1054 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_patch)
NOTE: Running task 1055 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_patch)
NOTE: recipe bluez5-5.55-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1058 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1059 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1060 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 1062 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_patch: Started
NOTE: Running task 1079 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.55-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1112 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.55-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1116 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1119 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1127 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1129 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: Running task 1130 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1131 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1132 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 1150 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1151 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_generate_toolchain_file)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1152 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic unihash changed to 591f691de0b952b674970a419d03d123b4ef2c9c6b6e6786694ca8823f69e220
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 1157 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-68.2-r0: task do_unpack: Succeeded
NOTE: Running task 1192 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_patch)
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1193 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-68.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1194 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_patch: Succeeded
NOTE: Running task 1195 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_make_icudata)
NOTE: Running task 1196 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-68.2-r0: task do_make_icudata: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.2-r0: task do_make_icudata: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1198 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 581 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1221 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 625 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 632 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1231 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1232 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 635 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 639 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1250 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running setscene task 645 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1274 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1283 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 677 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1288 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1344 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 750 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1405 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8aee874b86bf32f2d6775679a54b0a6b02a3acbb944a6280782ba5b76ec44d91
NOTE: Running task 1426 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 775 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 793 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 797 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 799 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1738 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1833 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1842 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1861 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1862 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1871 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1932 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 606c018e80990d3d160802f550d145d7183be4710cf26edb902f108f7c3dc2e0
NOTE: Running task 2262 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2273 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2274 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2286 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_configure)
NOTE: Running task 2287 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: Running task 2289 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2309 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2310 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe icu-68.2-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2312 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2315 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_compile)
NOTE: recipe icu-68.2-r0: task do_compile: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Started
NOTE: Running task 2321 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: Running task 2323 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 2327 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Succeeded
NOTE: Running task 2328 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot)
NOTE: Running task 2329 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2330 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2331 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2337 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2338 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2339 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2340 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_configure)
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2346 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2348 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2349 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2350 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2353 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 2354 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_compile)
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2356 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2357 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2358 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2359 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2361 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2362 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm)
NOTE: Running task 2363 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2366 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: Running task 2367 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libdrm-2.4.103-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2368 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2369 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Succeeded
NOTE: Running task 2372 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: Running task 2373 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2376 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2378 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: Running task 2384 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2385 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2386 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2389 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2392 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2397 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2401 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2404 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2405 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2406 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2407 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2410 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_install)
NOTE: recipe icu-68.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2413 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: Running task 2416 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot)
NOTE: Running task 2418 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2419 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2420 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2421 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_configure)
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2424 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2425 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe libical-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 2427 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_compile)
NOTE: recipe libical-3.0.8-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata)
NOTE: recipe icu-68.2-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2429 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2430 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe icu-68.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_compile)
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Started
NOTE: recipe libical-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_install)
NOTE: recipe libical-3.0.8-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 2435 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 2436 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package)
NOTE: recipe libical-3.0.8-r0: task do_package: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2437 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2438 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_configure: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata)
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_configure: Succeeded
NOTE: Running task 2442 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2443 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile)
NOTE: recipe bluez5-5.55-r0: task do_compile: Started
NOTE: recipe bluez5-5.55-r0: task do_compile: Succeeded
NOTE: Running task 2444 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_install)
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot)
NOTE: Running task 2447 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package)
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2448 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2449 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2450 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install)
NOTE: recipe bluez5-5.55-r0: task do_install: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_install: Succeeded
NOTE: Running task 2452 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install_ptest_base)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2453 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package)
NOTE: Running task 2454 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_package: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2455 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2456 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2457 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_configure)
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_package: Succeeded
NOTE: Running task 2458 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2459 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_compile)
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Started
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_install)
NOTE: recipe libpcap-1.10.0-r0: task do_install: Started
NOTE: recipe libpcap-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package)
NOTE: Running task 2462 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_package: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_packagedata)
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2464 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_write_rpm)
NOTE: Running task 2465 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_qa)
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2466 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2469 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2470 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2471 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2473 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_install)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package)
NOTE: Running task 2477 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2478 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2481 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_compile)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2483 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_install)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2484 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2485 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2486 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2487 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2488 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2488 tasks of which 2177 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============8970490060355578458==
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
DISTRO_VERSION       = "3.2+snapshot-b93c988940d0863d2f8b3c7860f1a68acc814769"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93c988940d0863d2f8b3c7860f1a68acc814769"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 129 Found 5 Missed 124 Current 659 (3% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 661 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 677 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 786 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: Running task 1086 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1244 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1251 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1257 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_fetch)
NOTE: Running task 1261 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_fetch)
NOTE: Running task 1285 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_fetch)
NOTE: Running task 1289 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1292 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_fetch)
NOTE: Running task 1315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 1316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_fetch)
NOTE: Running task 1342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_fetch)
NOTE: Running task 1396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1480 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_write_config)
NOTE: recipe libical-3.0.8-r0: task do_fetch: Started
NOTE: Running task 1517 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1518 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_write_config)
NOTE: Running task 1539 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libical-3.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 1558 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_unpack)
NOTE: Running task 1562 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1588 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_fetch)
NOTE: Running task 1589 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_unpack)
NOTE: Running task 1590 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe icu-68.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1591 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1592 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Started
NOTE: Running task 1593 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1594 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1595 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1596 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: Running task 1597 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1598 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1599 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1600 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-68.2-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1601 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_unpack)
NOTE: Running task 1602 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: Running task 1603 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_unpack)
NOTE: Running task 1604 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: Running task 1605 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1606 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Started
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1607 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1608 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1609 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1610 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_unpack: Started
NOTE: Running task 1611 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Started
NOTE: Running task 1612 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1613 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_unpack)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1614 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1615 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: Running task 1616 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: Running task 1617 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_unpack)
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1626 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe libical-3.0.8-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1642 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_patch)
NOTE: recipe icu-68.2-r0: task do_unpack: Started
NOTE: Running task 1669 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_unpack)
NOTE: Running task 1725 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1726 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: Running task 1734 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_write_config)
NOTE: Running task 1736 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1757 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: Running task 1761 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: Running task 1773 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: Running task 1774 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.55-r0: task do_unpack: Started
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1907 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1915 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1956 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_write_config)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1975 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2016 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 2025 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running task 2067 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2093 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2169 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Succeeded
NOTE: Running task 2170 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: Running task 2171 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Started
NOTE: Running task 2172 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2173 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: Running task 2174 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 2177 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2178 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 2179 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_unpack: Succeeded
NOTE: Running task 2180 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2181 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2182 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_patch: Succeeded
NOTE: Running task 2183 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_patch)
NOTE: Running task 2184 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_generate_toolchain_file)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 2185 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2187 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2188 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2189 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.55-r0: task do_patch: Started
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2190 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2191 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Started
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 2193 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bluez5-5.55-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2195 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch)
NOTE: Running task 2196 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2197 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2198 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2199 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic unihash changed to 591f691de0b952b674970a419d03d123b4ef2c9c6b6e6786694ca8823f69e220
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: Running task 2200 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2201 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2203 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: Running task 2204 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2205 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2206 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2207 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2208 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: Running task 2209 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c961e1b507439ea1c330271d040ab6ee92c4dce7926f5d1a6aa27a1015e2bb87
NOTE: Running task 2232 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2242 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2253 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe icu-68.2-r0: task do_unpack: Succeeded
NOTE: Running task 2254 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2255 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_patch)
NOTE: recipe icu-68.2-r0: task do_patch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_patch: Succeeded
NOTE: Running task 2256 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_make_icudata)
NOTE: Running task 2257 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 19cc089a98f77e08e9f9ea2d7007eb5a13fbc73703034d5bbdc3d372ce429274
NOTE: Setscene tasks completed
NOTE: Running task 2274 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.2-r0: task do_make_icudata: Started
NOTE: recipe icu-68.2-r0: task do_make_icudata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 2288 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2289 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.2-r0: task do_configure: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2294 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2295 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2297 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe icu-68.2-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2301 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2308 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Succeeded
NOTE: Running task 2309 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot)
NOTE: Running task 2310 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2311 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2312 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2313 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 2314 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2318 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 2321 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2322 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2323 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2324 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2326 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2327 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2330 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2331 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Succeeded
NOTE: Running task 2332 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2333 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 2335 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2337 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2339 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2340 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2347 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_install)
NOTE: recipe libdrm-2.4.103-r0: task do_install: Started
NOTE: recipe libdrm-2.4.103-r0: task do_install: Succeeded
NOTE: Running task 2349 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot)
NOTE: Running task 2350 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_compile)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_install)
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libdrm-2.4.103-r0: task do_package: Succeeded
NOTE: Running task 2356 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Succeeded
NOTE: Running task 2358 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2360 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: Running task 2363 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2364 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2367 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2368 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2369 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2370 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2376 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2385 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2386 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2389 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2391 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: recipe icu-68.2-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe icu-68.2-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_configure)
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe icu-68.2-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot)
NOTE: Running task 2401 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package)
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2403 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2404 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_configure)
NOTE: recipe libical-3.0.8-r0: task do_configure: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_compile)
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe icu-68.2-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata)
NOTE: recipe icu-68.2-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_compile)
NOTE: recipe libical-3.0.8-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2409 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm)
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2411 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2412 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 2413 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_install)
NOTE: recipe libical-3.0.8-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 2416 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package)
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2417 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure)
NOTE: recipe bluez5-5.55-r0: task do_configure: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata)
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2422 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile)
NOTE: recipe bluez5-5.55-r0: task do_compile: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_install)
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package)
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2426 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2427 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Succeeded
NOTE: Running task 2429 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2431 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2432 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install)
NOTE: recipe bluez5-5.55-r0: task do_install: Started
NOTE: recipe bluez5-5.55-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2434 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package)
NOTE: Running task 2435 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_package: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2436 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2437 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_configure)
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2439 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_compile)
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2440 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2441 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_install)
NOTE: recipe libpcap-1.10.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2442 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2443 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe libpcap-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2444 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package)
NOTE: Running task 2445 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_package: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2446 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2447 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2448 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2449 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2450 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libpcap-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_write_rpm)
NOTE: Running task 2453 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_install)
NOTE: Running task 2454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_qa)
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package)
NOTE: Running task 2456 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2457 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2459 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2460 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_compile)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_install)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2464 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2466 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2467 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2467 tasks of which 2162 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============8970490060355578458==
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
DISTRO_VERSION       = "3.2+snapshot-b93c988940d0863d2f8b3c7860f1a68acc814769"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93c988940d0863d2f8b3c7860f1a68acc814769"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 129 Found 5 Missed 124 Current 659 (3% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 661 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 677 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 786 of 788 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: Running task 1086 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
ERROR: iproute2-5.9.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.10.0-r0 to 0:5.9.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1244 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1251 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1257 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_fetch)
NOTE: Running task 1261 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_fetch)
NOTE: Running task 1285 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_fetch)
NOTE: Running task 1289 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1292 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_fetch)
NOTE: Running task 1315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 1316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_fetch)
NOTE: Running task 1343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_fetch)
NOTE: Running task 1454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1480 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libical-3.0.8-r0: task do_fetch: Started
NOTE: Running task 1517 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1518 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe icu-68.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1539 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1540 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe bluez5-5.55-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: Running task 1541 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1542 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_unpack)
NOTE: Running task 1543 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: Running task 1544 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_unpack)
NOTE: Running task 1545 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-68.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe bluez5-5.55-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1546 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_unpack)
NOTE: Running task 1547 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_unpack)
NOTE: Running task 1548 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1549 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1551 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libical-3.0.8-r0: task do_unpack: Started
NOTE: Running task 1552 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1553 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_unpack)
NOTE: Running task 1554 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: Running task 1555 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1556 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1557 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1558 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1559 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1560 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1561 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1562 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1563 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_unpack)
NOTE: Running task 1564 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1565 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Started
NOTE: Running task 1566 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Started
NOTE: Running task 1588 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1614 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_fetch)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe mesa-2_20.3.1-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe icu-68.2-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1656 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libical-3.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1693 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_patch)
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1722 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_fetch)
NOTE: Running task 1723 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: Running task 1731 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_write_config)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1747 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_patch)
NOTE: Running task 1757 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe bluez5-5.55-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1822 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: Running task 1823 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1831 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1839 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1849 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.8-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: Running task 1913 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_unpack)
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1953 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_unpack)
NOTE: Running task 1955 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_write_config)
NOTE: Running task 1975 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 2015 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_unpack)
NOTE: Running task 2016 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: Running task 2022 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Started
NOTE: Running task 2138 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Started
NOTE: Running task 2168 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Started
NOTE: Running task 2169 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_patch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 2170 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 2171 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libpcap-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: Running task 2172 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_patch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: Running task 2173 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2174 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2175 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2177 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_generate_toolchain_file)
NOTE: Running task 2178 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2179 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2180 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 2181 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 2182 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_patch)
NOTE: recipe bluez5-5.55-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2184 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_patch)
NOTE: Running task 2185 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2186 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2187 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2188 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: Running task 2189 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: Running task 2190 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2191 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic)
NOTE: Running task 2192 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2193 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2195 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2196 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2198 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2199 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2200 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe bluez5-5.55-r0: task do_patch: Succeeded
NOTE: Running task 2201 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2202 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2203 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_lic unihash changed to 591f691de0b952b674970a419d03d123b4ef2c9c6b6e6786694ca8823f69e220
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcap-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cd4c61dd8a6ed1b3ad75c3dc51c019d64a81088a9ff8e572e5451c8eccc1c2bf
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: Running task 2226 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2227 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 2228 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: Running task 2229 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_configure)
NOTE: Running task 2230 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: Running task 2231 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2241 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2252 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2253 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-68.2-r0: task do_unpack: Succeeded
NOTE: Running task 2254 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_patch)
NOTE: recipe icu-68.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2a19e722cc67a7f7657c848ae4d23cc5d17c2bda02f1f9ef02bd50166c44b01a
NOTE: Setscene tasks completed
NOTE: Running task 2271 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe mesa-2_20.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 2284 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe icu-68.2-r0: task do_patch: Succeeded
NOTE: Running task 2285 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_make_icudata)
NOTE: Running task 2286 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.2-r0: task do_make_icudata: Started
NOTE: recipe icu-68.2-r0: task do_make_icudata: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2288 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_configure)
NOTE: recipe mesa-2_20.3.1-r0: task do_patch: Succeeded
NOTE: Running task 2289 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2291 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2293 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2294 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2295 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2297 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-68.2-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe icu-68.2-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2301 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2305 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2308 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2309 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot)
NOTE: Running task 2310 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2311 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2312 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 2313 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package)
NOTE: Running task 2314 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2317 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2321 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 2322 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 2323 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2325 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2326 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2330 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_configure)
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2331 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2332 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2335 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2339 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2340 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Succeeded
NOTE: Running task 2343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Started
NOTE: Running task 2345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2347 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_install)
NOTE: recipe libdrm-2.4.103-r0: task do_install: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Succeeded
NOTE: Running task 2349 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_compile)
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.103-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_install)
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Succeeded
NOTE: Running task 2355 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Succeeded
NOTE: Running task 2359 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2360 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2363 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2364 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: Running task 2367 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2369 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: Running task 2370 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2372 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2373 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2374 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2375 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2376 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2380 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2383 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2384 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2385 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2386 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2388 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2391 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_configure)
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2397 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2398 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_install)
NOTE: recipe icu-68.2-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-68.2-r0: task do_install: Succeeded
NOTE: Running task 2401 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot)
NOTE: Running task 2402 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package)
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-68.2-r0: task do_package: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2403 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2404 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_compile)
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Started
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2405 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_configure)
NOTE: recipe libical-3.0.8-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2408 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-68.2-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata)
NOTE: recipe icu-68.2-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 2410 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_compile)
NOTE: recipe icu-68.2-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_compile: Started
NOTE: Running task 2411 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm)
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2412 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2413 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_install)
NOTE: recipe libical-3.0.8-r0: task do_install: Started
NOTE: recipe libical-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 2416 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package)
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2417 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure)
NOTE: recipe bluez5-5.55-r0: task do_configure: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata)
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-68.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2422 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile)
NOTE: recipe bluez5-5.55-r0: task do_compile: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_install)
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package)
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2426 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2427 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package: Succeeded
NOTE: Running task 2429 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2431 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2432 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2434 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2435 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2436 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2437 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2438 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2440 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_install)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2441 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package)
NOTE: Running task 2442 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2443 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2444 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2445 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2446 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_install)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2449 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2451 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2452 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install)
NOTE: recipe bluez5-5.55-r0: task do_install: Started
NOTE: recipe bluez5-5.55-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package)
NOTE: Running task 2455 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot)
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_package: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2456 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2457 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_configure)
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_package: Succeeded
NOTE: Running task 2458 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Started
NOTE: recipe libpcap-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2460 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_compile)
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Started
NOTE: recipe libpcap-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2461 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_install)
NOTE: recipe libpcap-1.10.0-r0: task do_install: Started
NOTE: recipe libpcap-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2462 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package)
NOTE: Running task 2463 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_populate_sysroot)
NOTE: recipe libpcap-1.10.0-r0: task do_package: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpcap-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2464 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_packagedata)
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_write_rpm)
NOTE: Running task 2466 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_package_qa)
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Started
NOTE: recipe libpcap-1.10.0-r0: task do_package_qa: Succeeded
NOTE: recipe libpcap-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2467 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libpcap/libpcap_1.10.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2467 tasks of which 2162 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============8970490060355578458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpcap: PV changed from "1.9.1" to "1.10.0"
packages/core2-32-poky-linux/libpcap: PKGV changed from 1.9.1 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libpcap: SRC_URI changed from "https://www.tcpdump.org/release/libpcap-1.9.1.tar.gz" to "https://www.tcpdump.org/release/libpcap-1.10.0.tar.gz"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PV changed from "1.9.1" to "1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PKGV changed from 1.9.1 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PKGSIZE changed from 960224 to 961400 (+0%)
packages/core2-32-poky-linux/libpcap/libpcap-dev: PV changed from "1.9.1" to "1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-dev: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-dev: PKGV changed from 1.9.1 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dev: PKGSIZE changed from 150281 to 160185 (+7%)
packages/core2-32-poky-linux/libpcap/libpcap-doc: PV changed from "1.9.1" to "1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-doc: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-doc: PKGV changed from 1.9.1 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libpcap/libpcap-doc: PKGSIZE changed from 227703 to 240444 (+6%)
packages/core2-32-poky-linux/libpcap/libpcap-locale: PV changed from "1.9.1" to "1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-locale: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-locale: PKGV changed from 1.9.1 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libpcap/libpcap-src: PV changed from "1.9.1" to "1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-src: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-src: PKGV changed from 1.9.1 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libpcap/libpcap-src: PKGSIZE changed from 1460281 to 1466731 (+0%)
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PV changed from "1.9.1" to "1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PKGV changed from 1.9.1 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PKGSIZE changed from 1369932 to 1395720 (+2%)
packages/core2-32-poky-linux/libpcap/libpcap: PV changed from "1.9.1" to "1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.9.1", added "/usr/lib/libpcap.so.1.10.0"
packages/core2-32-poky-linux/libpcap/libpcap: PKGV changed from 1.9.1 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/libpcap/libpcap: PKGSIZE changed from 325164 to 325101 (-0%)
Changes to packages/core2-32-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.9.1 to libpcap.so.1.10.0
  /usr/lib/libpcap.so.1.10.0 was added
  /usr/lib/libpcap.so.1.9.1 was removed

--===============8970490060355578458==--
