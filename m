Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.26026.1623000257969781396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3B0E538C1290
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 590 SUCCEEDED
Message-ID: <MADEUP.16860E22BE86199B.29797@lists.openembedded.org>
X-Groupsio-MsgNum: 152710
Content-Type: multipart/mixed; boundary="===============3315555635290375937=="

--===============3315555635290375937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *less* to *590* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-586-590.patch
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

--===============3315555635290375937==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-less-upgrade-586-590.patch"

From 429fba83790e0f78aa9b51c8b41030ec99717f14 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 09:58:46 +0000
Subject: [PATCH] less: upgrade 586 -> 590

---
 meta/recipes-extended/less/{less_586.bb => less_590.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_586.bb => less_590.bb} (93%)

diff --git a/meta/recipes-extended/less/less_586.bb b/meta/recipes-extended/less/less_590.bb
similarity index 93%
rename from meta/recipes-extended/less/less_586.bb
rename to meta/recipes-extended/less/less_590.bb
index b300f2badd..82a2312642 100644
--- a/meta/recipes-extended/less/less_586.bb
+++ b/meta/recipes-extended/less/less_590.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "09288d3ec515a21430ec1fbe1e97a2f741fdaf98afc95b114e342416c6a7dd99"
+SRC_URI[sha256sum] = "6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.17.1


--===============3315555635290375937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/less: PV changed from "586" to "590"
packages/core2-32-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-586.tar.gz" to "http://www.greenwoodsoftware.com/less/less-590.tar.gz"
packages/core2-32-poky-linux/less: PKGV changed from 586 [default] to 590 [default]
packages/core2-32-poky-linux/less/less-dbg: PV changed from "586" to "590"
packages/core2-32-poky-linux/less/less-dbg: PKGSIZE changed from 481012 to 483068 (+0%)
packages/core2-32-poky-linux/less/less-dbg: PKGV changed from 586 [default] to 590 [default]
packages/core2-32-poky-linux/less/less-dev: PV changed from "586" to "590"
packages/core2-32-poky-linux/less/less-dev: PKGV changed from 586 [default] to 590 [default]
packages/core2-32-poky-linux/less/less-doc: PV changed from "586" to "590"
packages/core2-32-poky-linux/less/less-doc: PKGSIZE changed from 86645 to 86644 (-0%)
packages/core2-32-poky-linux/less/less-doc: PKGV changed from 586 [default] to 590 [default]
packages/core2-32-poky-linux/less/less-locale: PV changed from "586" to "590"
packages/core2-32-poky-linux/less/less-locale: PKGV changed from 586 [default] to 590 [default]
packages/core2-32-poky-linux/less/less-src: PV changed from "586" to "590"
packages/core2-32-poky-linux/less/less-src: PKGSIZE changed from 677009 to 678564 (+0%)
packages/core2-32-poky-linux/less/less-src: PKGV changed from 586 [default] to 590 [default]
packages/core2-32-poky-linux/less/less-staticdev: PV changed from "586" to "590"
packages/core2-32-poky-linux/less/less-staticdev: PKGV changed from 586 [default] to 590 [default]
packages/core2-32-poky-linux/less/less: PV changed from "586" to "590"
packages/core2-32-poky-linux/less/less: PKGSIZE changed from 255776 to 259884 (+2%)
packages/core2-32-poky-linux/less/less: PKGV changed from 586 [default] to 590 [default]

--===============3315555635290375937==--
