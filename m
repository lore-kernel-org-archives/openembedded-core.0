Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.287.1615826521274045859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1370838C12B7
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wpebackend-fdo: upgrading to 1.8.1 SUCCEEDED
Message-ID: <MADEUP.166C91A95916453B.27320@lists.openembedded.org>
X-Groupsio-MsgNum: 149528
Content-Type: multipart/mixed; boundary="===============8697926278102177576=="

--===============8697926278102177576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wpebackend-fdo* to *1.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wpebackend-fdo-upgrade-1.8.0-1.8.1.patch
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

--===============8697926278102177576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wpebackend-fdo: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/wpebackend-fdo: SRC_URI changed from "https://wpewebkit.org/releases/wpebackend-fdo-1.8.0.tar.xz" to "https://wpewebkit.org/releases/wpebackend-fdo-1.8.1.tar.xz"
Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.6.3 to libWPEBackend-fdo-1.0.so.1.6.4
  /usr/lib/libWPEBackend-fdo-1.0.so.1.6.3 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.6.4
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGSIZE changed from 1170000 to 1230520 (+5%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PKGSIZE changed from 35669 to 35603 (-0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGSIZE changed from 254273 to 255123 (+0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PV changed from "1.8.0" to "1.8.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PKGV changed from 1.8.0 [default] to 1.8.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PV changed from "1.8.0" to "1.8.1"

--===============8697926278102177576==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-wpebackend-fdo-upgrade-1.8.0-1.8.1.patch"

From 9f46ead35a99afa370ba6dc71f734e15d6c534a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 14:32:10 +0000
Subject: [PATCH] wpebackend-fdo: upgrade 1.8.0 -> 1.8.1

---
 .../webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.0.bb => wpebackend-fdo_1.8.1.bb} (89%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.1.bb
similarity index 89%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.8.1.bb
index 344aa9717c..8f44dc32cc 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.1.bb
@@ -13,7 +13,7 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9652a99c75fe1c6eab0585b6395f4e104b2427e4d1f42969f1f77df29920d253"
+SRC_URI[sha256sum] = "8adb4475be949ae4092370de6a37d7b9e1d3704cf4674867312e87de2ff0d880"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.17.1


--===============8697926278102177576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.6.3 to libWPEBackend-fdo-1.0.so.1.6.4
  /usr/lib/libWPEBackend-fdo-1.0.so.1.6.3 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.6.4
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.3", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.6.4"

--===============8697926278102177576==--
