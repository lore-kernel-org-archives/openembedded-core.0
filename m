Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12221.1602843683193938299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 737D138C177C
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] help2man: upgrading to 1.47.16 SUCCEEDED
Message-ID: <MADEUP.163E71D69FEA02AA.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143438
Content-Type: multipart/mixed; boundary="===============5426519628605800279=="

--===============5426519628605800279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *help2man* to *1.47.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-help2man-upgrade-1.47.15-1.47.16.patch
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

--===============5426519628605800279==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-help2man-upgrade-1.47.15-1.47.16.patch"

From ab5e2cec3039356ad518939c7ae8a5804a2b9b5b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 03:09:25 +0000
Subject: [PATCH] help2man: upgrade 1.47.15 -> 1.47.16

---
 .../help2man/{help2man_1.47.15.bb => help2man_1.47.16.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.47.15.bb => help2man_1.47.16.bb} (86%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.47.15.bb b/meta/recipes-devtools/help2man/help2man_1.47.16.bb
similarity index 86%
rename from meta/recipes-devtools/help2man/help2man_1.47.15.bb
rename to meta/recipes-devtools/help2man/help2man_1.47.16.bb
index 6ab9f6cbe7..27a15eb0e2 100644
--- a/meta/recipes-devtools/help2man/help2man_1.47.15.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.47.16.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c25a35b30eceb315361484b0ff1f81c924e8ee5c8881576f1ee762f001dbcd1c"
+SRC_URI[sha256sum] = "3ef8580c5b86e32ca092ce8de43df204f5e6f714b0cd32bc6237e6cd0f34a8f4"
 
 inherit autotools
 
-- 
2.18.4


--===============5426519628605800279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/help2man/help2man-dbg: PKGV changed from 1.47.15 [default] to 1.47.16 [default]
packages/core2-32-poky-linux/help2man/help2man-dbg: PV changed from "1.47.15" to "1.47.16"
packages/core2-32-poky-linux/help2man/help2man-dev: PKGV changed from 1.47.15 [default] to 1.47.16 [default]
packages/core2-32-poky-linux/help2man/help2man-dev: PV changed from "1.47.15" to "1.47.16"
packages/core2-32-poky-linux/help2man/help2man-doc: PKGV changed from 1.47.15 [default] to 1.47.16 [default]
packages/core2-32-poky-linux/help2man/help2man-doc: PV changed from "1.47.15" to "1.47.16"
packages/core2-32-poky-linux/help2man/help2man-doc: PKGSIZE changed from 22143 to 22148 (+0%)
packages/core2-32-poky-linux/help2man/help2man-locale: PKGV changed from 1.47.15 [default] to 1.47.16 [default]
packages/core2-32-poky-linux/help2man/help2man-locale: PV changed from "1.47.15" to "1.47.16"
packages/core2-32-poky-linux/help2man/help2man-src: PKGV changed from 1.47.15 [default] to 1.47.16 [default]
packages/core2-32-poky-linux/help2man/help2man-src: PV changed from "1.47.15" to "1.47.16"
packages/core2-32-poky-linux/help2man/help2man-staticdev: PKGV changed from 1.47.15 [default] to 1.47.16 [default]
packages/core2-32-poky-linux/help2man/help2man-staticdev: PV changed from "1.47.15" to "1.47.16"
packages/core2-32-poky-linux/help2man/help2man: PKGV changed from 1.47.15 [default] to 1.47.16 [default]
packages/core2-32-poky-linux/help2man/help2man: PV changed from "1.47.15" to "1.47.16"
packages/core2-32-poky-linux/help2man: PKGV changed from 1.47.15 [default] to 1.47.16 [default]
packages/core2-32-poky-linux/help2man: PV changed from "1.47.15" to "1.47.16"

--===============5426519628605800279==--
