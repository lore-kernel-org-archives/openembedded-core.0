Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.700.1610713822710119607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 31CDE38C135F
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.50.3 SUCCEEDED
Message-ID: <MADEUP.165A67B0307C08FD.4055@lists.openembedded.org>
X-Groupsio-MsgNum: 146774
Content-Type: multipart/mixed; boundary="===============2646304165720714495=="

--===============2646304165720714495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.50.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.50.2-0.50.3.patch
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

--===============2646304165720714495==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.50.2-0.50.3.patch"

From 293f61037857b72262fe07b294ddb55408e7d679 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 06:12:39 +0000
Subject: [PATCH] vala: upgrade 0.50.2 -> 0.50.3

---
 meta/recipes-devtools/vala/{vala_0.50.2.bb => vala_0.50.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.50.2.bb => vala_0.50.3.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.50.2.bb b/meta/recipes-devtools/vala/vala_0.50.3.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.50.2.bb
rename to meta/recipes-devtools/vala/vala_0.50.3.bb
index b5913fca8b..302f562549 100644
--- a/meta/recipes-devtools/vala/vala_0.50.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.50.3.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "2c0d5dc6d65d070f724063075424c403765ab7935c9e6fbcb84981b94d07ceda"
+SRC_URI[sha256sum] = "6165c1b42beca4856e2fb9a31c5e81949d76fa670e2f0cfc8389ce9b95eca5db"
-- 
2.27.0


--===============2646304165720714495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PV changed from "0.50.2" to "0.50.3"
packages/core2-32-poky-linux/vala: PKGV changed from 0.50.2 [default] to 0.50.3 [default]
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.50/vala-0.50.2.tar.xz file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.50/vala-0.50.3.tar.xz file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.50.2" to "0.50.3"
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.50.2 [default] to 0.50.3 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 18347272 to 18369784 (+0%)
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.50.2" to "0.50.3"
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.50.2 [default] to 0.50.3 [default]
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.50.2" to "0.50.3"
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.50.2 [default] to 0.50.3 [default]
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 9711 to 9708 (-0%)
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.50.2" to "0.50.3"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.50.2 [default] to 0.50.3 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.50.2" to "0.50.3"
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.50.2 [default] to 0.50.3 [default]
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15070419 to 15088369 (+0%)
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.50.2" to "0.50.3"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.50.2 [default] to 0.50.3 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.50.2" to "0.50.3"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.50.2 [default] to 0.50.3 [default]
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 12213715 to 12224506 (+0%)

--===============2646304165720714495==--
