Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5214.1613463853145404236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0DBED38C1288
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxt: upgrading to 1.2.1 SUCCEEDED
Message-ID: <MADEUP.16642CD3779A7CDA.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148145
Content-Type: multipart/mixed; boundary="===============1123015638957010327=="

--===============1123015638957010327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxt* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxt-upgrade-1.2.0-1.2.1.patch
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

--===============1123015638957010327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libxt/libxt-src: PKGSIZE changed from 1399467 to 1571686 (+12%)

--===============1123015638957010327==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libxt-upgrade-1.2.0-1.2.1.patch"

From 8fc3ea17dd11a0d8c2707af396897f375d7b606b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 04:58:04 +0000
Subject: [PATCH] libxt: upgrade 1.2.0 -> 1.2.1

---
 .../xorg-lib/{libxt_1.2.0.bb => libxt_1.2.1.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.2.0.bb => libxt_1.2.1.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
index 54384521c8..8f2cded1df 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
@@ -24,8 +24,7 @@ XORG_PN = "libXt"
 
 SRC_URI += "file://libxt_fix_for_x32.patch"
 
-SRC_URI[md5sum] = "a9019421d3ee8b4937b6afd9025f018a"
-SRC_URI[sha256sum] = "b31df531dabed9f4611fc8980bc51d7782967e2aff44c4105251a1acb5a77831"
+SRC_URI[sha256sum] = "679cc08f1646dbd27f5e48ffe8dd49406102937109130caab02ca32c083a3d60"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


--===============1123015638957010327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxt: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxt: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxt: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXt-1.2.0.tar.bz2 file://libxt_fix_for_x32.patch" to "https://www.x.org/releases//individual/lib/libXt-1.2.1.tar.bz2 file://libxt_fix_for_x32.patch"
packages/core2-32-poky-linux/libxt/libxt-dbg: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxt/libxt-dbg: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxt/libxt-dbg: PKGSIZE changed from 1511316 to 1510444 (-0%)
packages/core2-32-poky-linux/libxt/libxt-dev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxt/libxt-dev: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxt/libxt-dev: PKGSIZE changed from 264733 to 264739 (+0%)
packages/core2-32-poky-linux/libxt/libxt-doc: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxt/libxt-doc: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxt/libxt-locale: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxt/libxt-locale: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxt/libxt-src: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxt/libxt-src: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxt/libxt-src: PKGSIZE changed from 1399467 to 1571686 (+12%)
packages/core2-32-poky-linux/libxt/libxt-staticdev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxt/libxt-staticdev: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libxt/libxt: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libxt/libxt: PV changed from "1.2.0" to "1.2.1"

--===============1123015638957010327==--
