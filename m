Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.24428.1608473714362442627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 47C8C38C13DC
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xprop: upgrading to 1.2.5 SUCCEEDED
Message-ID: <MADEUP.16527252AF8DE1EA.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145966
Content-Type: multipart/mixed; boundary="===============2014799476843561428=="

--===============2014799476843561428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xprop* to *1.2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xprop-upgrade-1.2.4-1.2.5.patch
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

--===============2014799476843561428==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xprop-upgrade-1.2.4-1.2.5.patch"

From 4a45e05feb8162c649bcef181c89a31965cb2b9f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 09:16:48 +0000
Subject: [PATCH] xprop: upgrade 1.2.4 -> 1.2.5

---
 .../xorg-app/{xprop_1.2.4.bb => xprop_1.2.5.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.4.bb => xprop_1.2.5.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.4.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.5.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.4.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.5.bb
index 3280813ef8..b1589a8d75 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.5.bb
@@ -14,5 +14,4 @@ DEPENDS += "libxmu"
 
 PE = "1"
 
-SRC_URI[md5sum] = "cc369c28383a5d7144e7197ee7d30bfa"
-SRC_URI[sha256sum] = "8c77fb096e46c60032b7e2bde9492c3ffcc18734f50b395085a5f10bfd3cf753"
+SRC_URI[sha256sum] = "9b92ed0316bf2486121d8bac88bd1878f16b43bd335f18009b1f941f1eca93a1"
-- 
2.20.1


--===============2014799476843561428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xprop: SRC_URI changed from "https://www.x.org/releases//individual/app/xprop-1.2.4.tar.bz2" to "https://www.x.org/releases//individual/app/xprop-1.2.5.tar.bz2"
packages/core2-32-poky-linux/xprop: PV changed from "1.2.4" to "1.2.5"
packages/core2-32-poky-linux/xprop: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/xprop/xprop-dbg: PKGSIZE changed from 116744 to 118260 (+1%)
packages/core2-32-poky-linux/xprop/xprop-dbg: PV changed from "1.2.4" to "1.2.5"
packages/core2-32-poky-linux/xprop/xprop-dbg: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/xprop/xprop-dev: PV changed from "1.2.4" to "1.2.5"
packages/core2-32-poky-linux/xprop/xprop-dev: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/xprop/xprop-doc: PV changed from "1.2.4" to "1.2.5"
packages/core2-32-poky-linux/xprop/xprop-doc: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/xprop/xprop-locale: PV changed from "1.2.4" to "1.2.5"
packages/core2-32-poky-linux/xprop/xprop-locale: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/xprop/xprop-src: PKGSIZE changed from 69556 to 71146 (+2%)
packages/core2-32-poky-linux/xprop/xprop-src: PV changed from "1.2.4" to "1.2.5"
packages/core2-32-poky-linux/xprop/xprop-src: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/xprop/xprop-staticdev: PV changed from "1.2.4" to "1.2.5"
packages/core2-32-poky-linux/xprop/xprop-staticdev: PKGV changed from 1.2.4 [default] to 1.2.5 [default]
packages/core2-32-poky-linux/xprop/xprop: PKGSIZE changed from 43496 to 47592 (+9%)
packages/core2-32-poky-linux/xprop/xprop: PV changed from "1.2.4" to "1.2.5"
packages/core2-32-poky-linux/xprop/xprop: PKGV changed from 1.2.4 [default] to 1.2.5 [default]

--===============2014799476843561428==--
