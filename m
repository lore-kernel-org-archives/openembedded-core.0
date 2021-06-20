Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.32457.1624189110777288477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id AC89238C1280
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxi: upgrading to 1.7.99.2 SUCCEEDED
Message-ID: <MADEUP.168A47641BF08B28.15584@lists.openembedded.org>
X-Groupsio-MsgNum: 153116
Content-Type: multipart/mixed; boundary="===============7368737706435006454=="

--===============7368737706435006454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxi* to *1.7.99.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxi-upgrade-1.7.10-1.7.99.2.patch
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

--===============7368737706435006454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxi: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXi-1.7.10.tar.bz2" to "https://www.x.org/releases//individual/lib/libXi-1.7.99.2.tar.bz2"
packages/core2-32-poky-linux/libxi/libxi-dbg: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-dbg: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-dbg: PKGSIZE changed from 1459860 to 1466456 (+0%)
packages/core2-32-poky-linux/libxi/libxi-dev: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-dev: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-dev: PKGSIZE changed from 55052 to 58235 (+6%)
packages/core2-32-poky-linux/libxi/libxi-doc: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-doc: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-doc: PKGSIZE changed from 236309 to 239280 (+1%)
packages/core2-32-poky-linux/libxi/libxi-locale: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-locale: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-src: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-src: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-src: PKGSIZE changed from 370810 to 382447 (+3%)
packages/core2-32-poky-linux/libxi/libxi-staticdev: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-staticdev: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi: PKGSIZE changed from 75170 to 79266 (+5%)

--===============7368737706435006454==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libxi-upgrade-1.7.10-1.7.99.2.patch"

From 76780c53269c966056a8960f7acfe49012467785 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 09:36:26 +0000
Subject: [PATCH] libxi: upgrade 1.7.10 -> 1.7.99.2

---
 .../xorg-lib/{libxi_1.7.10.bb => libxi_1.7.99.2.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.10.bb => libxi_1.7.99.2.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
index 5a08e07362..8afa9aa527 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
@@ -17,7 +17,6 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "62c4af0839072024b4b1c8cbe84216c7"
-SRC_URI[sha256sum] = "36a30d8f6383a72e7ce060298b4b181fd298bc3a135c8e201b7ca847f5f81061"
+SRC_URI[sha256sum] = "2ce90ebcb7fa0c3ed671924f1268b8f4c500fff62e1284699fc413e182a7896b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


--===============7368737706435006454==--
