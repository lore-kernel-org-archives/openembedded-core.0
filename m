Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.5914.1626056249023031480
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 96FBA38C12A4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 21.1.2 SUCCEEDED
Message-ID: <MADEUP.1690E98B1B5D844A.27803@lists.openembedded.org>
X-Groupsio-MsgNum: 153753
Content-Type: multipart/mixed; boundary="===============2534281232087945662=="

--===============2534281232087945662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *21.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-21.1.1-21.1.2.patch
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

--===============2534281232087945662==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-21.1.1-21.1.2.patch"

From a3ed575d38717974c7eb86bcfd20675bb2665d66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 20:49:05 +0000
Subject: [PATCH] xwayland: upgrade 21.1.1 -> 21.1.2

---
 .../xwayland/{xwayland_21.1.1.bb => xwayland_21.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_21.1.1.bb => xwayland_21.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
index f5db7cc5db..794a7bd98d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "31f261ce51bbee76a6ca3ec02aa367ffa2b5efa2b98412df57ccefd7a19003ce"
+SRC_URI[sha256sum] = "b81cbdd5ad60b8b7ad8c3ecc7ec2a28c9bf021448670735cebb501f08bebd18b"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.20.1


--===============2534281232087945662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-21.1.1.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-21.1.2.tar.xz"
packages/core2-32-poky-linux/xwayland: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10052424 to 10052892 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8412469 to 8414275 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 21.1.1 [default] to 21.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "21.1.1" to "21.1.2"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 21.1.1 [default] to 21.1.2 [default]

--===============2534281232087945662==--
