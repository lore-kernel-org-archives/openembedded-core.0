Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5219.1613463848596552830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id CE3A538C128C
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwpe: upgrading to 1.9.1 SUCCEEDED
Message-ID: <MADEUP.16642CD3A5DEDE8A.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148149
Content-Type: multipart/mixed; boundary="===============8232959652316462581=="

--===============8232959652316462581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwpe* to *1.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwpe-upgrade-1.8.0-1.9.1.patch
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

--===============8232959652316462581==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libwpe-upgrade-1.8.0-1.9.1.patch"

From e3f8ceb96776e45d213e7acebec1348e230243e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 05:49:02 +0000
Subject: [PATCH] libwpe: upgrade 1.8.0 -> 1.9.1

---
 meta/recipes-sato/webkit/{libwpe_1.8.0.bb => libwpe_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.8.0.bb => libwpe_1.9.1.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.8.0.bb b/meta/recipes-sato/webkit/libwpe_1.9.1.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.8.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.9.1.bb
index a81e6960b2..c42552e47f 100644
--- a/meta/recipes-sato/webkit/libwpe_1.8.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.9.1.bb
@@ -14,4 +14,4 @@ inherit cmake features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a6f00a7d091cbd4db57fe7ee3b4c12c6350921d654ed79812800a26c888481d2"
+SRC_URI[sha256sum] = "ac1470f9811e74a5f9b063e25d27ed9e274a74078c65fbdcc6f6e3c590010bb8"
-- 
2.17.1


--===============8232959652316462581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwpe/libwpe-dev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-doc: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-locale: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.4.3 to libwpe-1.0.so.1.4.2
  /usr/lib/libwpe-1.0.so.1.4.3 moved to /usr/lib/libwpe-1.0.so.1.4.2

--===============8232959652316462581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwpe: SRC_URI changed from "https://wpewebkit.org/releases/libwpe-1.8.0.tar.xz" to "https://wpewebkit.org/releases/libwpe-1.9.1.tar.xz"
packages/core2-32-poky-linux/libwpe: PKGV changed from 1.8.0 [default] to 1.9.1 [default]
packages/core2-32-poky-linux/libwpe: PV changed from "1.8.0" to "1.9.1"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGSIZE changed from 234132 to 234236 (+0%)
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGV changed from 1.8.0 [default] to 1.9.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PV changed from "1.8.0" to "1.9.1"
packages/core2-32-poky-linux/libwpe/libwpe-dev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGSIZE changed from 235931 to 235899 (-0%)
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGV changed from 1.8.0 [default] to 1.9.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dev: PV changed from "1.8.0" to "1.9.1"
packages/core2-32-poky-linux/libwpe/libwpe-doc: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-doc: PKGV changed from 1.8.0 [default] to 1.9.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-doc: PV changed from "1.8.0" to "1.9.1"
packages/core2-32-poky-linux/libwpe/libwpe-locale: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-locale: PKGV changed from 1.8.0 [default] to 1.9.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-locale: PV changed from "1.8.0" to "1.9.1"
packages/core2-32-poky-linux/libwpe/libwpe-src: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGSIZE changed from 209199 to 209271 (+0%)
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGV changed from 1.8.0 [default] to 1.9.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-src: PV changed from "1.8.0" to "1.9.1"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PKGV changed from 1.8.0 [default] to 1.9.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PV changed from "1.8.0" to "1.9.1"
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.4.3", added "/usr/lib/libwpe-1.0.so.1.4.2"
packages/core2-32-poky-linux/libwpe/libwpe: PKGV changed from 1.8.0 [default] to 1.9.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe: PV changed from "1.8.0" to "1.9.1"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.4.3 to libwpe-1.0.so.1.4.2
  /usr/lib/libwpe-1.0.so.1.4.3 moved to /usr/lib/libwpe-1.0.so.1.4.2

--===============8232959652316462581==--
