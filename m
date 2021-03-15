Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.288.1615826521298806729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 12FF438C12E1
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 580 SUCCEEDED
Message-ID: <MADEUP.166C91A9181C2D2C.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149505
Content-Type: multipart/mixed; boundary="===============8502064668819333560=="

--===============8502064668819333560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *less* to *580* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-563-580.patch
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

--===============8502064668819333560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/less: PV changed from "563" to "580"
packages/core2-32-poky-linux/less: PKGV changed from 563 [default] to 580 [default]
packages/core2-32-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-563.tar.gz" to "http://www.greenwoodsoftware.com/less/less-580.tar.gz"
packages/core2-32-poky-linux/less/less-dbg: PV changed from "563" to "580"
packages/core2-32-poky-linux/less/less-dbg: PKGV changed from 563 [default] to 580 [default]
packages/core2-32-poky-linux/less/less-dbg: PKGSIZE changed from 473888 to 495596 (+5%)
packages/core2-32-poky-linux/less/less-dev: PV changed from "563" to "580"
packages/core2-32-poky-linux/less/less-dev: PKGV changed from 563 [default] to 580 [default]
packages/core2-32-poky-linux/less/less-doc: PV changed from "563" to "580"
packages/core2-32-poky-linux/less/less-doc: PKGV changed from 563 [default] to 580 [default]
packages/core2-32-poky-linux/less/less-doc: PKGSIZE changed from 81648 to 86068 (+5%)
packages/core2-32-poky-linux/less/less-locale: PV changed from "563" to "580"
packages/core2-32-poky-linux/less/less-locale: PKGV changed from 563 [default] to 580 [default]
packages/core2-32-poky-linux/less/less-src: PV changed from "563" to "580"
packages/core2-32-poky-linux/less/less-src: PKGV changed from 563 [default] to 580 [default]
packages/core2-32-poky-linux/less/less-src: PKGSIZE changed from 628556 to 668068 (+6%)
packages/core2-32-poky-linux/less/less-staticdev: PV changed from "563" to "580"
packages/core2-32-poky-linux/less/less-staticdev: PKGV changed from 563 [default] to 580 [default]
packages/core2-32-poky-linux/less/less: PV changed from "563" to "580"
packages/core2-32-poky-linux/less/less: PKGV changed from 563 [default] to 580 [default]
packages/core2-32-poky-linux/less/less: PKGSIZE changed from 234048 to 242696 (+4%)

--===============8502064668819333560==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-less-upgrade-563-580.patch"

From d565ef720dbb64874d917117d0c06eb2cf0b4028 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 06:44:54 +0000
Subject: [PATCH] less: upgrade 563 -> 580

---
 meta/recipes-extended/less/{less_563.bb => less_580.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_563.bb => less_580.bb} (93%)

diff --git a/meta/recipes-extended/less/less_563.bb b/meta/recipes-extended/less/less_580.bb
similarity index 93%
rename from meta/recipes-extended/less/less_563.bb
rename to meta/recipes-extended/less/less_580.bb
index 123522b5dc..7181347695 100644
--- a/meta/recipes-extended/less/less_563.bb
+++ b/meta/recipes-extended/less/less_580.bb
@@ -28,7 +28,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "ce5b6d2b9fc4442d7a07c93ab128d2dff2ce09a1d4f2d055b95cf28dd0dc9a9a"
+SRC_URI[sha256sum] = "5b5c606e3de2e8d93929342c89e71861a4a6766210f65e1c05a75f8cf62fa287"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.17.1


--===============8502064668819333560==--
