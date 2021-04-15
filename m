Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1290.1618510599610507745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2AB8738C11E5
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.11.0 SUCCEEDED
Message-ID: <MADEUP.16761AD14EE30676.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150553
Content-Type: multipart/mixed; boundary="===============7023424779405102545=="

--===============7023424779405102545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.10.0-2.11.0.patch
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

--===============7023424779405102545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-dev: FILELIST: removed "/usr/lib/libva-drm.so.2.1000.0 /usr/lib/libva.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-doc: FILELIST: removed "/usr/lib/libva-drm.so.2.1000.0 /usr/lib/libva.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-drm.so.2.1000.0 /usr/lib/libva.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-locale: FILELIST: removed "/usr/lib/libva-drm.so.2.1000.0 /usr/lib/libva.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-staticdev: FILELIST: removed "/usr/lib/libva-drm.so.2.1000.0 /usr/lib/libva.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-drm.so.2.1000.0 /usr/lib/libva.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-drm.so.2.1000.0 /usr/lib/libva.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.1000.0 /usr/lib/libva.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1000.0 to libva-drm.so.2.1100.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1000.0 to libva-glx.so.2.1100.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1000.0 to libva.so.2.1100.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1000.0 to libva-wayland.so.2.1100.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1000.0 to libva-x11.so.2.1100.0
  /usr/lib/libva-drm.so.2.1000.0 moved to /usr/lib/libva-drm.so.2.1100.0
  /usr/lib/libva-glx.so.2.1000.0 moved to /usr/lib/libva-glx.so.2.1100.0
  /usr/lib/libva.so.2.1000.0 moved to /usr/lib/libva.so.2.1100.0
  /usr/lib/libva-wayland.so.2.1000.0 moved to /usr/lib/libva-wayland.so.2.1100.0
  /usr/lib/libva-x11.so.2.1000.0 moved to /usr/lib/libva-x11.so.2.1100.0
  /usr/include/va/va_backend_prot.h was added
  /usr/include/va/va_prot.h was added

--===============7023424779405102545==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.10.0-2.11.0.patch"

From 33ee2b854981013caf02a674b8e0f8304102249b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 12:38:33 +0000
Subject: [PATCH] libva: upgrade 2.10.0 -> 2.11.0

---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.10.0.bb => libva_2.11.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.10.0.bb => libva_2.11.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index d251afa125..43d916cd1c 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "fa81e35b50d9818fce5ec9eeeeff08a24a8864ceeb9a5c8e7ae4446eacfc0236"
+SRC_URI[sha256sum] = "6e361117038b571ad4741d38c9280db8c140b17e76e8c01fc7a4d608d3ed7d5d"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.10.0.bb b/meta/recipes-graphics/libva/libva_2.11.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.10.0.bb
rename to meta/recipes-graphics/libva/libva_2.11.0.bb
-- 
2.27.0


--===============7023424779405102545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.10.0/libva-2.10.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.11.0/libva-2.11.0.tar.bz2"
packages/core2-32-poky-linux/libva: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 775248 to 782724 (+1%)
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 552413 to 585929 (+6%)
packages/core2-32-poky-linux/libva/libva-dev: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-doc: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-locale: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 996891 to 1035368 (+4%)
packages/core2-32-poky-linux/libva/libva-src: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-staticdev: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.10.0" to "2.11.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.1000.0 /usr/lib/libva-drm.so.2.1000.0", added "/usr/lib/libva-drm.so.2.1100.0 /usr/lib/libva.so.2.1100.0"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/core2-32-poky-linux/libva/libva: PV changed from "2.10.0" to "2.11.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1000.0 to libva-drm.so.2.1100.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1000.0 to libva-glx.so.2.1100.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1000.0 to libva.so.2.1100.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1000.0 to libva-wayland.so.2.1100.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1000.0 to libva-x11.so.2.1100.0
  /usr/lib/libva-drm.so.2.1000.0 moved to /usr/lib/libva-drm.so.2.1100.0
  /usr/lib/libva-glx.so.2.1000.0 moved to /usr/lib/libva-glx.so.2.1100.0
  /usr/lib/libva.so.2.1000.0 moved to /usr/lib/libva.so.2.1100.0
  /usr/lib/libva-wayland.so.2.1000.0 moved to /usr/lib/libva-wayland.so.2.1100.0
  /usr/lib/libva-x11.so.2.1000.0 moved to /usr/lib/libva-x11.so.2.1100.0
  /usr/include/va/va_backend_prot.h was added
  /usr/include/va/va_prot.h was added

--===============7023424779405102545==--
