Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.24168.1608473715079816509
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1B08338C1492
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.50.2 SUCCEEDED
Message-ID: <MADEUP.1652725392B2EFAC.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145997
Content-Type: multipart/mixed; boundary="===============1816471455267751890=="

--===============1816471455267751890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.50.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.50.1-0.50.2.patch
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

--===============1816471455267751890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PKGV changed from 0.50.1 [default] to 0.50.2 [default]
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.50/vala-0.50.1.tar.xz file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.50/vala-0.50.2.tar.xz file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
packages/core2-32-poky-linux/vala: PV changed from "0.50.1" to "0.50.2"
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 18358428 to 18347272 (-0%)
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.50.1 [default] to 0.50.2 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.50.1" to "0.50.2"
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.50.1 [default] to 0.50.2 [default]
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.50.1" to "0.50.2"
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 9715 to 9711 (-0%)
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.50.1 [default] to 0.50.2 [default]
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.50.1" to "0.50.2"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.50.1 [default] to 0.50.2 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.50.1" to "0.50.2"
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15071894 to 15070419 (-0%)
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.50.1 [default] to 0.50.2 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.50.1" to "0.50.2"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.50.1 [default] to 0.50.2 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.50.1" to "0.50.2"
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 12199713 to 12213715 (+0%)
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.50.1 [default] to 0.50.2 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.50.1" to "0.50.2"

--===============1816471455267751890==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.50.1-0.50.2.patch"

From ef81f0612405c311d928b994c8281de8f6477bc3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 03:22:49 +0000
Subject: [PATCH] vala: upgrade 0.50.1 -> 0.50.2

---
 meta/recipes-devtools/vala/{vala_0.50.1.bb => vala_0.50.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.50.1.bb => vala_0.50.2.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.50.1.bb b/meta/recipes-devtools/vala/vala_0.50.2.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.50.1.bb
rename to meta/recipes-devtools/vala/vala_0.50.2.bb
index cca7eef523..b5913fca8b 100644
--- a/meta/recipes-devtools/vala/vala_0.50.1.bb
+++ b/meta/recipes-devtools/vala/vala_0.50.2.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "958d9f06c9c3d7d1b2145512a9bc2a7c6aefbbf0416a04c7a0ecf463f7138f6c"
+SRC_URI[sha256sum] = "2c0d5dc6d65d070f724063075424c403765ab7935c9e6fbcb84981b94d07ceda"
-- 
2.20.1


--===============1816471455267751890==--
