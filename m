Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4688.1621074783110567208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4474C38C1286
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnss-mdns: upgrading to 0.15 SUCCEEDED
Message-ID: <MADEUP.167F36ED3342A323.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151777
Content-Type: multipart/mixed; boundary="===============4325715402315316842=="

--===============4325715402315316842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnss-mdns* to *0.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnss-mdns-upgrade-0.14.1-0.15.patch
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

--===============4325715402315316842==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libnss-mdns-upgrade-0.14.1-0.15.patch"

From ee7f4b79f5015a6423f7dbca5eead20b197d0704 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 03:23:25 +0000
Subject: [PATCH] libnss-mdns: upgrade 0.14.1 -> 0.15

---
 .../libnss-mdns/{libnss-mdns_0.14.1.bb => libnss-mdns_0.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libnss-mdns/{libnss-mdns_0.14.1.bb => libnss-mdns_0.15.bb} (95%)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
similarity index 95%
rename from meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
rename to meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
index 9a83898e52..75e8ba06d9 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb
@@ -11,7 +11,7 @@ DEPENDS = "avahi"
 SRC_URI = "git://github.com/lathiat/nss-mdns \
            "
 
-SRCREV = "41c9c5e78f287ed4b41ac438c1873fa71bfa70ae"
+SRCREV = "65ad25563937682ab2770c36d56667a754837102"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============4325715402315316842==
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
DISTRO_VERSION       = "3.3+snapshot-f818de85b90c74540486f2b783a7a810380bad85"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f818de85b90c74540486f2b783a7a810380bad85"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 4 Network 0 Missed 26 Current 716 (13% match, 96% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 718 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 744 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: Running task 1101 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1529 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1530 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1587 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1663 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1684 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1884 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1885 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1908 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1993 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 2036 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2232 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2235 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Succeeded
NOTE: Running task 2236 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 2237 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_lic: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2238 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_lic unihash changed to 51afb3d477b8539cce9e68fa6ed50c4cd66642f202a06ce036f949abeba79ac3
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2239 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2240 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fdc085f12a4d811512eea39b42cb39da3075c7dd059d1ed45cec0a329ddedd03
NOTE: Running task 2260 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2284 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2285 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2286 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5cb53070dbb10dcbca6c781f2d0d18a10bbd606585db2df219cbfd8496662dbf
NOTE: Setscene tasks completed
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Running task 2313 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2321 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2327 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2330 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: Running task 2334 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_configure)
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_compile)
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package)
NOTE: Running task 2341 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Succeeded
NOTE: Running task 2342 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2343 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: Running task 2344 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_write_rpm)
NOTE: Running task 2345 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_qa)
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_qa: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_qa: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2346 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_build)
NOTE: Tasks Summary: Attempted 2346 tasks of which 2289 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============4325715402315316842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-f818de85b90c74540486f2b783a7a810380bad85"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f818de85b90c74540486f2b783a7a810380bad85"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 4 Network 0 Missed 26 Current 716 (13% match, 96% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 718 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 744 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: Running task 1101 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1529 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1530 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1587 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1663 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1684 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1858 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1859 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1876 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1965 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: Running task 2166 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2205 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2235 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Succeeded
NOTE: Running task 2236 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 2237 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2238 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_lic: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2239 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2240 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_lic: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_lic unihash changed to 51afb3d477b8539cce9e68fa6ed50c4cd66642f202a06ce036f949abeba79ac3
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2241 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2242 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2243 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dfc85dadf1206a4718fcd43404d130a7b709788edf0b6c43786e4dda281f1a9e
NOTE: Running task 2262 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2286 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 061780a75f7483885c15732173b5f425eb7788983e95873c1e812fae0568b1c3
NOTE: Setscene tasks completed
NOTE: Running task 2315 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2321 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2327 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2330 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: Running task 2334 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_configure)
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_compile)
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package)
NOTE: Running task 2341 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Succeeded
NOTE: Running task 2342 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2343 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: Running task 2344 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_write_rpm)
NOTE: Running task 2345 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_qa)
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_qa: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_qa: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2346 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_build)
NOTE: Tasks Summary: Attempted 2346 tasks of which 2289 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============4325715402315316842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-32 sysroot...done.
Removing 111 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'libnss-mdns'
libnss-mdns was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============4325715402315316842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 58 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-f818de85b90c74540486f2b783a7a810380bad85"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f818de85b90c74540486f2b783a7a810380bad85"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 4 Network 0 Missed 26 Current 716 (13% match, 96% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 718 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 744 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: Running task 1100 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1529 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1530 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1587 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1663 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1684 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1900 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1901 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 2015 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 2105 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: Running task 2113 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2232 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2235 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Succeeded
NOTE: Running task 2236 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 2237 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2238 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2239 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_lic unihash changed to 51afb3d477b8539cce9e68fa6ed50c4cd66642f202a06ce036f949abeba79ac3
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2240 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65bc2a999d0249cb2ac560c03e36a22609b1ba46f75d58326fd303d12a9c2adc
NOTE: Running task 2260 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2261 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2285 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2286 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 185fae5bf3ad4b72e8f86b78c04c5d7744ac78cbbc043d6773f94805f81a53c8
NOTE: Setscene tasks completed
NOTE: Running task 2313 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2321 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2327 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2330 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: Running task 2334 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_configure)
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_compile)
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package)
NOTE: Running task 2341 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Succeeded
NOTE: Running task 2342 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2343 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: Running task 2344 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_write_rpm)
NOTE: Running task 2345 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_qa)
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_qa: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_qa: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2346 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_build)
NOTE: Tasks Summary: Attempted 2346 tasks of which 2289 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 17 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============4325715402315316842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-f818de85b90c74540486f2b783a7a810380bad85"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f818de85b90c74540486f2b783a7a810380bad85"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 4 Network 0 Missed 26 Current 716 (13% match, 96% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 718 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 744 of 746 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: Running task 1101 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
ERROR: iproute2-5.11.0-r0 do_packagedata_setscene: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:5.12.0-r0 to 0:5.11.0-r0) [version-going-backwards]
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1529 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1530 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1587 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1663 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: Running task 1684 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_fetch)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1939 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1940 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1954 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2043 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libnss-mdns-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 2088 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2232 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2235 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_patch: Succeeded
NOTE: Running task 2236 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 2237 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_lic: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2238 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2239 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_lic unihash changed to 51afb3d477b8539cce9e68fa6ed50c4cd66642f202a06ce036f949abeba79ac3
NOTE: recipe libnss-mdns-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2240 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2241 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2242 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2243 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3efc4f5e67f95cd8a1a7756b3c20cad69a0ca7af90542ea68811d9f5bb3f5e72
NOTE: Running task 2262 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2286 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6d0e6e66a0affae81c0be3ba3f3e6c5aaac827a3f69de942bd3e101e3df77be5
NOTE: Setscene tasks completed
NOTE: Running task 2313 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2317 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2321 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2327 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2330 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: Running task 2334 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_configure)
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_compile)
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_install)
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package)
NOTE: Running task 2341 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_populate_sysroot)
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package: Succeeded
NOTE: Running task 2342 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2343 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: Running task 2344 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_write_rpm)
NOTE: Running task 2345 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_package_qa)
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_qa: Started
NOTE: recipe libnss-mdns-0.15-r0: task do_package_qa: Succeeded
NOTE: recipe libnss-mdns-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2346 of 2346 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.bb:do_build)
NOTE: Tasks Summary: Attempted 2346 tasks of which 2289 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 19 ERROR messages shown, returning a non-zero exit code.

--===============4325715402315316842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libnss-mdns: PV changed from "0.14.1" to "0.15"
packages/core2-32-poky-linux/libnss-mdns: PKGV changed from 0.14.1 [default] to 0.15 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dbg: PKGSIZE changed from 221744 to 218456 (-1%)
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dbg: PV changed from "0.14.1" to "0.15"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dbg: PKGV changed from 0.14.1 [default] to 0.15 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dev: PV changed from "0.14.1" to "0.15"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-dev: PKGV changed from 0.14.1 [default] to 0.15 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-doc: PV changed from "0.14.1" to "0.15"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-doc: PKGV changed from 0.14.1 [default] to 0.15 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-locale: PV changed from "0.14.1" to "0.15"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-locale: PKGV changed from 0.14.1 [default] to 0.15 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-src: PKGSIZE changed from 31935 to 29349 (-8%)
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-src: PV changed from "0.14.1" to "0.15"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-src: PKGV changed from 0.14.1 [default] to 0.15 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-staticdev: PV changed from "0.14.1" to "0.15"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns-staticdev: PKGV changed from 0.14.1 [default] to 0.15 [default]
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns: PV changed from "0.14.1" to "0.15"
packages/core2-32-poky-linux/libnss-mdns/libnss-mdns: PKGV changed from 0.14.1 [default] to 0.15 [default]

--===============4325715402315316842==--
