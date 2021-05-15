Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.4453.1621074783574671062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2AD0638C13C6
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wpebackend-fdo: upgrading to 1.8.4 SUCCEEDED
Message-ID: <MADEUP.167F36EDD6486D81.8589@lists.openembedded.org>
X-Groupsio-MsgNum: 151839
Content-Type: multipart/mixed; boundary="===============3585992360720864891=="

--===============3585992360720864891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wpebackend-fdo* to *1.8.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wpebackend-fdo-upgrade-1.8.3-1.8.4.patch
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

--===============3585992360720864891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-wpebackend-fdo-upgrade-1.8.3-1.8.4.patch"

From 934214ec30bc709c4d0bb1da9dad776665a7e9c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 09:44:07 +0000
Subject: [PATCH] wpebackend-fdo: upgrade 1.8.3 -> 1.8.4

---
 .../webkit/{wpebackend-fdo_1.8.3.bb => wpebackend-fdo_1.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.3.bb => wpebackend-fdo_1.8.4.bb} (89%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb
similarity index 89%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb
index d27111a456..28b2a927a5 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb
@@ -13,7 +13,7 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3d0b4282a1bd9e0664d7a20abe14e982f3285296ac62de56cae2a404b9d28b9e"
+SRC_URI[sha256sum] = "def59bed5e8cdabb65ffa76ee2eef349fba7b42a75dac80f3da5954b17f4074a"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.27.0


--===============3585992360720864891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.6.6 to libWPEBackend-fdo-1.0.so.1.6.7
  /usr/lib/libWPEBackend-fdo-1.0.so.1.6.6 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.6.7
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"

--===============3585992360720864891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wpebackend-fdo: SRC_URI changed from "https://wpewebkit.org/releases/wpebackend-fdo-1.8.3.tar.xz" to "https://wpewebkit.org/releases/wpebackend-fdo-1.8.4.tar.xz"
packages/core2-32-poky-linux/wpebackend-fdo: PV changed from "1.8.3" to "1.8.4"
packages/core2-32-poky-linux/wpebackend-fdo: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.6.6 to libWPEBackend-fdo-1.0.so.1.6.7
  /usr/lib/libWPEBackend-fdo-1.0.so.1.6.6 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.6.7
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PV changed from "1.8.3" to "1.8.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGSIZE changed from 1158288 to 1207660 (+4%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PV changed from "1.8.3" to "1.8.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PV changed from "1.8.3" to "1.8.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PV changed from "1.8.3" to "1.8.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PV changed from "1.8.3" to "1.8.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGSIZE changed from 255539 to 256099 (+0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PV changed from "1.8.3" to "1.8.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PV changed from "1.8.3" to "1.8.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.6", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.7"

--===============3585992360720864891==--
