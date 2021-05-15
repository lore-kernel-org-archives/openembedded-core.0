Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4464.1621074783442767245
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 630ED38C13B7
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 586 SUCCEEDED
Message-ID: <MADEUP.167F36ED6E71C1BB.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151807
Content-Type: multipart/mixed; boundary="===============1579459410694930309=="

--===============1579459410694930309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *less* to *586* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-581-586.patch
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

--===============1579459410694930309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-less-upgrade-581-586.patch"

From 6a51bca527bce9dae8c9bf5016c16d0c4bb0cb7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 05:45:55 +0000
Subject: [PATCH] less: upgrade 581 -> 586

---
 meta/recipes-extended/less/{less_581.bb => less_586.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_581.bb => less_586.bb} (93%)

diff --git a/meta/recipes-extended/less/less_581.bb b/meta/recipes-extended/less/less_586.bb
similarity index 93%
rename from meta/recipes-extended/less/less_581.bb
rename to meta/recipes-extended/less/less_586.bb
index 17f8dfb6b9..b300f2badd 100644
--- a/meta/recipes-extended/less/less_581.bb
+++ b/meta/recipes-extended/less/less_586.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "1d077f83fe7867e0ecfd278eab3122326b21c22c9161366189c38e09b96a2c65"
+SRC_URI[sha256sum] = "09288d3ec515a21430ec1fbe1e97a2f741fdaf98afc95b114e342416c6a7dd99"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.27.0


--===============1579459410694930309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/less: PKGV changed from 581 [default] to 586 [default]
packages/core2-32-poky-linux/less: PV changed from "581" to "586"
packages/core2-32-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-581.tar.gz" to "http://www.greenwoodsoftware.com/less/less-586.tar.gz"
packages/core2-32-poky-linux/less/less-dbg: PKGV changed from 581 [default] to 586 [default]
packages/core2-32-poky-linux/less/less-dbg: PV changed from "581" to "586"
packages/core2-32-poky-linux/less/less-dbg: PKGSIZE changed from 458296 to 480868 (+5%)
packages/core2-32-poky-linux/less/less-dev: PKGV changed from 581 [default] to 586 [default]
packages/core2-32-poky-linux/less/less-dev: PV changed from "581" to "586"
packages/core2-32-poky-linux/less/less-doc: PKGV changed from 581 [default] to 586 [default]
packages/core2-32-poky-linux/less/less-doc: PV changed from "581" to "586"
packages/core2-32-poky-linux/less/less-doc: PKGSIZE changed from 86148 to 86645 (+1%)
packages/core2-32-poky-linux/less/less-locale: PKGV changed from 581 [default] to 586 [default]
packages/core2-32-poky-linux/less/less-locale: PV changed from "581" to "586"
packages/core2-32-poky-linux/less/less-src: PKGV changed from 581 [default] to 586 [default]
packages/core2-32-poky-linux/less/less-src: PV changed from "581" to "586"
packages/core2-32-poky-linux/less/less-src: PKGSIZE changed from 668463 to 677009 (+1%)
packages/core2-32-poky-linux/less/less-staticdev: PKGV changed from 581 [default] to 586 [default]
packages/core2-32-poky-linux/less/less-staticdev: PV changed from "581" to "586"
packages/core2-32-poky-linux/less/less: PKGV changed from 581 [default] to 586 [default]
packages/core2-32-poky-linux/less/less: PV changed from "581" to "586"
packages/core2-32-poky-linux/less/less: PKGSIZE changed from 250888 to 255776 (+2%)

--===============1579459410694930309==--
