Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.24456.1608473715027681901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9643B38C1520
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.10.0 SUCCEEDED
Message-ID: <MADEUP.16527252A381D898.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145964
Content-Type: multipart/mixed; boundary="===============4835057117024094462=="

--===============4835057117024094462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.9.0-2.10.0.patch
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

--===============4835057117024094462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.9.0/libva-2.9.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.10.0/libva-2.10.0.tar.bz2"
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 766832 to 777764 (+1%)
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 543313 to 552413 (+2%)
packages/core2-32-poky-linux/libva/libva-dev: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-doc: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGSIZE changed from 21888 to 21889 (+0%)
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-locale: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 986854 to 996834 (+1%)
packages/core2-32-poky-linux/libva/libva-src: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-staticdev: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGSIZE changed from 21960 to 21961 (+0%)
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGSIZE changed from 26044 to 26045 (+0%)
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/core2-32-poky-linux/libva/libva: PV changed from "2.9.0" to "2.10.0"
packages/core2-32-poky-linux/libva/libva: PKGSIZE changed from 223836 to 223838 (+0%)
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.900.0 to libva-drm.so.2.1000.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.900.0 to libva-glx.so.2.1000.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.900.0 to libva.so.2.1000.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.900.0 to libva-wayland.so.2.1000.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.900.0 to libva-x11.so.2.1000.0
  /usr/lib/libva-drm.so.2.1000.0 was added
  /usr/lib/libva-glx.so.2.1000.0 was added
  /usr/lib/libva.so.2.1000.0 was added
  /usr/lib/libva-wayland.so.2.1000.0 was added
  /usr/lib/libva-x11.so.2.1000.0 was added
  /usr/lib/libva-drm.so.2.900.0 was removed
  /usr/lib/libva-glx.so.2.900.0 was removed
  /usr/lib/libva.so.2.900.0 was removed
  /usr/lib/libva-wayland.so.2.900.0 was removed
  /usr/lib/libva-x11.so.2.900.0 was removed

--===============4835057117024094462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-dev: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-doc: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-locale: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-staticdev: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.900.0 /usr/lib/libva-drm.so.2.900.0", added "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.900.0 to libva-drm.so.2.1000.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.900.0 to libva-glx.so.2.1000.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.900.0 to libva.so.2.1000.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.900.0 to libva-wayland.so.2.1000.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.900.0 to libva-x11.so.2.1000.0
  /usr/lib/libva-drm.so.2.1000.0 was added
  /usr/lib/libva-glx.so.2.1000.0 was added
  /usr/lib/libva.so.2.1000.0 was added
  /usr/lib/libva-wayland.so.2.1000.0 was added
  /usr/lib/libva-x11.so.2.1000.0 was added
  /usr/lib/libva-drm.so.2.900.0 was removed
  /usr/lib/libva-glx.so.2.900.0 was removed
  /usr/lib/libva.so.2.900.0 was removed
  /usr/lib/libva-wayland.so.2.900.0 was removed
  /usr/lib/libva-x11.so.2.900.0 was removed

--===============4835057117024094462==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.9.0-2.10.0.patch"

From 8bdef0e424139b70711d2eb6f4fe4d833168facf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 08:08:14 +0000
Subject: [PATCH] libva: upgrade 2.9.0 -> 2.10.0

---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 meta/recipes-graphics/libva/{libva_2.9.0.bb => libva_2.10.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.9.0.bb => libva_2.10.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 7b6f11674d..d251afa125 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "e344c1392dde92696c9ffd9cb3c7277d0a3b912236eb4e0fdedf7f375434584b"
+SRC_URI[sha256sum] = "fa81e35b50d9818fce5ec9eeeeff08a24a8864ceeb9a5c8e7ae4446eacfc0236"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.9.0.bb b/meta/recipes-graphics/libva/libva_2.10.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.9.0.bb
rename to meta/recipes-graphics/libva/libva_2.10.0.bb
-- 
2.20.1


--===============4835057117024094462==--
