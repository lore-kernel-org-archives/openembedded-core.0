Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.2168.1622683485305380270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id B176438C08DA
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:45 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 589 SUCCEEDED
Message-ID: <MADEUP.1684EE08758D682C.11265@lists.openembedded.org>
X-Groupsio-MsgNum: 152571
Content-Type: multipart/mixed; boundary="===============0468865228703369003=="

--===============0468865228703369003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *less* to *589* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-586-589.patch
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

--===============0468865228703369003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/less: PKGV changed from 586 [default] to 589 [default]
packages/core2-32-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-586.tar.gz" to "http://www.greenwoodsoftware.com/less/less-589.tar.gz"
packages/core2-32-poky-linux/less: PV changed from "586" to "589"
packages/core2-32-poky-linux/less/less-dbg: PKGSIZE changed from 481012 to 483068 (+0%)
packages/core2-32-poky-linux/less/less-dbg: PKGV changed from 586 [default] to 589 [default]
packages/core2-32-poky-linux/less/less-dbg: PV changed from "586" to "589"
packages/core2-32-poky-linux/less/less-dev: PKGV changed from 586 [default] to 589 [default]
packages/core2-32-poky-linux/less/less-dev: PV changed from "586" to "589"
packages/core2-32-poky-linux/less/less-doc: PKGSIZE changed from 86645 to 86644 (-0%)
packages/core2-32-poky-linux/less/less-doc: PKGV changed from 586 [default] to 589 [default]
packages/core2-32-poky-linux/less/less-doc: PV changed from "586" to "589"
packages/core2-32-poky-linux/less/less-locale: PKGV changed from 586 [default] to 589 [default]
packages/core2-32-poky-linux/less/less-locale: PV changed from "586" to "589"
packages/core2-32-poky-linux/less/less-src: PKGSIZE changed from 677009 to 678521 (+0%)
packages/core2-32-poky-linux/less/less-src: PKGV changed from 586 [default] to 589 [default]
packages/core2-32-poky-linux/less/less-src: PV changed from "586" to "589"
packages/core2-32-poky-linux/less/less-staticdev: PKGV changed from 586 [default] to 589 [default]
packages/core2-32-poky-linux/less/less-staticdev: PV changed from "586" to "589"
packages/core2-32-poky-linux/less/less: PKGSIZE changed from 255776 to 259884 (+2%)
packages/core2-32-poky-linux/less/less: PKGV changed from 586 [default] to 589 [default]
packages/core2-32-poky-linux/less/less: PV changed from "586" to "589"

--===============0468865228703369003==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-less-upgrade-586-589.patch"

From ae7128f9fa0b69af356c6d2bb08ab159b270231b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 2 Jun 2021 20:18:36 +0000
Subject: [PATCH] less: upgrade 586 -> 589

---
 meta/recipes-extended/less/{less_586.bb => less_589.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_586.bb => less_589.bb} (93%)

diff --git a/meta/recipes-extended/less/less_586.bb b/meta/recipes-extended/less/less_589.bb
similarity index 93%
rename from meta/recipes-extended/less/less_586.bb
rename to meta/recipes-extended/less/less_589.bb
index b300f2badd..cf459a382d 100644
--- a/meta/recipes-extended/less/less_586.bb
+++ b/meta/recipes-extended/less/less_589.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "09288d3ec515a21430ec1fbe1e97a2f741fdaf98afc95b114e342416c6a7dd99"
+SRC_URI[sha256sum] = "a15cd502196c1fb2c1f0235db19d4baad564d07be00df42281d6f1f056f5dda8"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.17.1


--===============0468865228703369003==--
