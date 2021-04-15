Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1331.1618510600196464745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 892E438C125F
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxres: upgrading to 1.2.1 SUCCEEDED
Message-ID: <MADEUP.16761AD161A18B75.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150564
Content-Type: multipart/mixed; boundary="===============4349095948074525540=="

--===============4349095948074525540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxres* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxres-upgrade-1.2.0-1.2.1.patch
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

--===============4349095948074525540==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libxres-upgrade-1.2.0-1.2.1.patch"

From 86aa65e0566ce86938d6ec358ed808fe7f8b8129 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 14:39:30 +0000
Subject: [PATCH] libxres: upgrade 1.2.0 -> 1.2.1

---
 .../xorg-lib/{libxres_1.2.0.bb => libxres_1.2.1.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.2.0.bb => libxres_1.2.1.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb
index af6bb19a25..29a799a328 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb
@@ -16,5 +16,4 @@ PE = "1"
 
 XORG_PN = "libXres"
 
-SRC_URI[md5sum] = "5d6d443d1abc8e1f6fc1c57fb27729bb"
-SRC_URI[sha256sum] = "ff75c1643488e64a7cfbced27486f0f944801319c84c18d3bd3da6bf28c812d4"
+SRC_URI[sha256sum] = "b6e6fb1ebb61610e56017edd928fb89a5f53b3f4f990078309877468663b2b11"
-- 
2.27.0


--===============4349095948074525540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxres: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxres: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxres: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXres-1.2.0.tar.bz2" to "https://www.x.org/releases//individual/lib/libXres-1.2.1.tar.bz2"
packages/core2-32-poky-linux/libxres/libxres-dbg: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxres/libxres-dbg: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxres/libxres-dev: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxres/libxres-dev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxres/libxres-dev: PKGSIZE changed from 2828 to 2892 (+2%)
packages/core2-32-poky-linux/libxres/libxres-doc: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxres/libxres-doc: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxres/libxres-locale: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxres/libxres-locale: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxres/libxres-src: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxres/libxres-src: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxres/libxres-src: PKGSIZE changed from 14224 to 14350 (+1%)
packages/core2-32-poky-linux/libxres/libxres-staticdev: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxres/libxres-staticdev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxres/libxres: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxres/libxres: PKGV changed from 1.2.0 [default] to 1.2.1 [default]

--===============4349095948074525540==--
