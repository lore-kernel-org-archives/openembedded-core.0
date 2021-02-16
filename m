Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5170.1613463848543488864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id D558538C1276
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:08 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] help2man: upgrading to 1.48.1 SUCCEEDED
Message-ID: <MADEUP.16642CD27E292FF4.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148107
Content-Type: multipart/mixed; boundary="===============1996346171703531760=="

--===============1996346171703531760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *help2man* to *1.48.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-help2man-upgrade-1.47.16-1.48.1.patch
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

--===============1996346171703531760==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-help2man-upgrade-1.47.16-1.48.1.patch"

From 331fef3bfda6731f5a8050cfa51d4d0037898c9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 20:29:55 +0000
Subject: [PATCH] help2man: upgrade 1.47.16 -> 1.48.1

---
 .../help2man/{help2man_1.47.16.bb => help2man_1.48.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.47.16.bb => help2man_1.48.1.bb} (86%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.47.16.bb b/meta/recipes-devtools/help2man/help2man_1.48.1.bb
similarity index 86%
rename from meta/recipes-devtools/help2man/help2man_1.47.16.bb
rename to meta/recipes-devtools/help2man/help2man_1.48.1.bb
index 27a15eb0e2..8341f2ba39 100644
--- a/meta/recipes-devtools/help2man/help2man_1.47.16.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.48.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3ef8580c5b86e32ca092ce8de43df204f5e6f714b0cd32bc6237e6cd0f34a8f4"
+SRC_URI[sha256sum] = "de8a74740bd058646567b92ab4ecdeb9da9f1a07cc7c4f607a3c14dd38d10799"
 
 inherit autotools
 
-- 
2.17.1


--===============1996346171703531760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/help2man/help2man-dbg: PKGV changed from 1.47.16 [default] to 1.48.1 [default]
packages/core2-32-poky-linux/help2man/help2man-dbg: PV changed from "1.47.16" to "1.48.1"
packages/core2-32-poky-linux/help2man/help2man-dev: PKGV changed from 1.47.16 [default] to 1.48.1 [default]
packages/core2-32-poky-linux/help2man/help2man-dev: PV changed from "1.47.16" to "1.48.1"
packages/core2-32-poky-linux/help2man/help2man-doc: PKGV changed from 1.47.16 [default] to 1.48.1 [default]
packages/core2-32-poky-linux/help2man/help2man-doc: PKGSIZE changed from 22148 to 22162 (+0%)
packages/core2-32-poky-linux/help2man/help2man-doc: PV changed from "1.47.16" to "1.48.1"
packages/core2-32-poky-linux/help2man/help2man-locale: PKGV changed from 1.47.16 [default] to 1.48.1 [default]
packages/core2-32-poky-linux/help2man/help2man-locale: PV changed from "1.47.16" to "1.48.1"
packages/core2-32-poky-linux/help2man/help2man-src: PKGV changed from 1.47.16 [default] to 1.48.1 [default]
packages/core2-32-poky-linux/help2man/help2man-src: PV changed from "1.47.16" to "1.48.1"
packages/core2-32-poky-linux/help2man/help2man-staticdev: PKGV changed from 1.47.16 [default] to 1.48.1 [default]
packages/core2-32-poky-linux/help2man/help2man-staticdev: PV changed from "1.47.16" to "1.48.1"
packages/core2-32-poky-linux/help2man/help2man: PKGV changed from 1.47.16 [default] to 1.48.1 [default]
packages/core2-32-poky-linux/help2man/help2man: PKGSIZE changed from 20042 to 20053 (+0%)
packages/core2-32-poky-linux/help2man/help2man: PV changed from "1.47.16" to "1.48.1"
packages/core2-32-poky-linux/help2man: PKGV changed from 1.47.16 [default] to 1.48.1 [default]
packages/core2-32-poky-linux/help2man: SRC_URI changed from "https://ftp.gnu.org/gnu/help2man/help2man-1.47.16.tar.xz" to "https://ftp.gnu.org/gnu/help2man/help2man-1.48.1.tar.xz"
packages/core2-32-poky-linux/help2man: PV changed from "1.47.16" to "1.48.1"

--===============1996346171703531760==--
