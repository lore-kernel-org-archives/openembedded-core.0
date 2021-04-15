Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1331.1618510600196464745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 960E438C140F
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 581 SUCCEEDED
Message-ID: <MADEUP.16761AD1373FC9B8.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150545
Content-Type: multipart/mixed; boundary="===============3966628882745040938=="

--===============3966628882745040938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *less* to *581* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-563-581.patch
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

--===============3966628882745040938==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-less-upgrade-563-581.patch"

From e2158806bd0f47eabb09ad078ebe478d2be76161 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 09:08:24 +0000
Subject: [PATCH] less: upgrade 563 -> 581

---
 meta/recipes-extended/less/{less_563.bb => less_581.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_563.bb => less_581.bb} (93%)

diff --git a/meta/recipes-extended/less/less_563.bb b/meta/recipes-extended/less/less_581.bb
similarity index 93%
rename from meta/recipes-extended/less/less_563.bb
rename to meta/recipes-extended/less/less_581.bb
index 123522b5dc..17f8dfb6b9 100644
--- a/meta/recipes-extended/less/less_563.bb
+++ b/meta/recipes-extended/less/less_581.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "ce5b6d2b9fc4442d7a07c93ab128d2dff2ce09a1d4f2d055b95cf28dd0dc9a9a"
+SRC_URI[sha256sum] = "1d077f83fe7867e0ecfd278eab3122326b21c22c9161366189c38e09b96a2c65"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.27.0


--===============3966628882745040938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/less: PV changed from "563" to "581"
packages/core2-32-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-563.tar.gz" to "http://www.greenwoodsoftware.com/less/less-581.tar.gz"
packages/core2-32-poky-linux/less: PKGV changed from 563 [default] to 581 [default]
packages/core2-32-poky-linux/less/less-dbg: PV changed from "563" to "581"
packages/core2-32-poky-linux/less/less-dbg: PKGSIZE changed from 473888 to 496012 (+5%)
packages/core2-32-poky-linux/less/less-dbg: PKGV changed from 563 [default] to 581 [default]
packages/core2-32-poky-linux/less/less-dev: PV changed from "563" to "581"
packages/core2-32-poky-linux/less/less-dev: PKGV changed from 563 [default] to 581 [default]
packages/core2-32-poky-linux/less/less-doc: PV changed from "563" to "581"
packages/core2-32-poky-linux/less/less-doc: PKGSIZE changed from 81648 to 86148 (+6%)
packages/core2-32-poky-linux/less/less-doc: PKGV changed from 563 [default] to 581 [default]
packages/core2-32-poky-linux/less/less-locale: PV changed from "563" to "581"
packages/core2-32-poky-linux/less/less-locale: PKGV changed from 563 [default] to 581 [default]
packages/core2-32-poky-linux/less/less-src: PV changed from "563" to "581"
packages/core2-32-poky-linux/less/less-src: PKGSIZE changed from 628556 to 668463 (+6%)
packages/core2-32-poky-linux/less/less-src: PKGV changed from 563 [default] to 581 [default]
packages/core2-32-poky-linux/less/less-staticdev: PV changed from "563" to "581"
packages/core2-32-poky-linux/less/less-staticdev: PKGV changed from 563 [default] to 581 [default]
packages/core2-32-poky-linux/less/less: PV changed from "563" to "581"
packages/core2-32-poky-linux/less/less: PKGSIZE changed from 234048 to 242696 (+4%)
packages/core2-32-poky-linux/less/less: PKGV changed from 563 [default] to 581 [default]

--===============3966628882745040938==--
