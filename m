Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12419.1602843683121280001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5855538C1785
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.9.0 SUCCEEDED
Message-ID: <MADEUP.163E71D703B49B1C.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143467
Content-Type: multipart/mixed; boundary="===============7662081549822890198=="

--===============7662081549822890198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.8.0-2.9.0.patch
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

--===============7662081549822890198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-dev: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-doc: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-locale: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-staticdev: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.800.0 to libva-drm.so.2.900.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.800.0 to libva-glx.so.2.900.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.800.0 to libva.so.2.900.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.800.0 to libva-wayland.so.2.900.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.800.0 to libva-x11.so.2.900.0
  /usr/lib/libva-drm.so.2.800.0 moved to /usr/lib/libva-drm.so.2.900.0
  /usr/lib/libva-glx.so.2.800.0 moved to /usr/lib/libva-glx.so.2.900.0
  /usr/lib/libva.so.2.800.0 moved to /usr/lib/libva.so.2.900.0
  /usr/lib/libva-wayland.so.2.800.0 moved to /usr/lib/libva-wayland.so.2.900.0
  /usr/lib/libva-x11.so.2.800.0 moved to /usr/lib/libva-x11.so.2.900.0

--===============7662081549822890198==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.8.0-2.9.0.patch"

From 00781ce502a3ee81428943a03ffb0f9a945450ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 07:49:39 +0000
Subject: [PATCH] libva: upgrade 2.8.0 -> 2.9.0

---
 meta/recipes-graphics/libva/{libva_2.8.0.bb => libva_2.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.8.0.bb => libva_2.9.0.bb} (89%)

diff --git a/meta/recipes-graphics/libva/libva_2.8.0.bb b/meta/recipes-graphics/libva/libva_2.9.0.bb
similarity index 89%
rename from meta/recipes-graphics/libva/libva_2.8.0.bb
rename to meta/recipes-graphics/libva/libva_2.9.0.bb
index 621ceea86c..21c14fd9fb 100644
--- a/meta/recipes-graphics/libva/libva_2.8.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.9.0.bb
@@ -1,7 +1,7 @@
 require libva.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "adbb1244d278908f89ccfcf254a442de6d71934565a492cb6f03caf2ed4d1ec3"
+SRC_URI[sha256sum] = "e344c1392dde92696c9ffd9cb3c7277d0a3b912236eb4e0fdedf7f375434584b"
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)} \
-- 
2.18.4


--===============7662081549822890198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 758668 to 766832 (+1%)
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 538326 to 543313 (+1%)
packages/core2-32-poky-linux/libva/libva-dev: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-doc: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-locale: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 971732 to 986854 (+2%)
packages/core2-32-poky-linux/libva/libva-src: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-staticdev: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.8.0" to "2.9.0"
packages/core2-32-poky-linux/libva/libva: PKGSIZE changed from 211548 to 223836 (+6%)
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.800.0 /usr/lib/libva.so.2.800.0", added "/usr/lib/libva-drm.so.2.900.0 /usr/lib/libva.so.2.900.0"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.8.0 [default] to 2.9.0 [default]
packages/core2-32-poky-linux/libva/libva: PV changed from "2.8.0" to "2.9.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.800.0 to libva-drm.so.2.900.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.800.0 to libva-glx.so.2.900.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.800.0 to libva.so.2.900.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.800.0 to libva-wayland.so.2.900.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.800.0 to libva-x11.so.2.900.0
  /usr/lib/libva-drm.so.2.800.0 moved to /usr/lib/libva-drm.so.2.900.0
  /usr/lib/libva-glx.so.2.800.0 moved to /usr/lib/libva-glx.so.2.900.0
  /usr/lib/libva.so.2.800.0 moved to /usr/lib/libva.so.2.900.0
  /usr/lib/libva-wayland.so.2.800.0 moved to /usr/lib/libva-wayland.so.2.900.0
  /usr/lib/libva-x11.so.2.800.0 moved to /usr/lib/libva-x11.so.2.900.0

--===============7662081549822890198==--
