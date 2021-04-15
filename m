Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1308.1618510600269848684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 08DC838C13BE
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] help2man: upgrading to 1.48.3 SUCCEEDED
Message-ID: <MADEUP.16761AD0DAC4ABA7.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150511
Content-Type: multipart/mixed; boundary="===============0340935042417649990=="

--===============0340935042417649990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *help2man* to *1.48.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-help2man-upgrade-1.48.2-1.48.3.patch
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

--===============0340935042417649990==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-help2man-upgrade-1.48.2-1.48.3.patch"

From 931727ebfcfadd5064de33af1d6eb2bc26bc97ba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 04:57:25 +0000
Subject: [PATCH] help2man: upgrade 1.48.2 -> 1.48.3

---
 .../help2man/{help2man_1.48.2.bb => help2man_1.48.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.48.2.bb => help2man_1.48.3.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.48.2.bb b/meta/recipes-devtools/help2man/help2man_1.48.3.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.48.2.bb
rename to meta/recipes-devtools/help2man/help2man_1.48.3.bb
index 3e9b509ed4..a612c0896c 100644
--- a/meta/recipes-devtools/help2man/help2man_1.48.2.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.48.3.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "20cb36111df91d61741a20680912ab0e4c59da479c3fb05837c6f0a8cb7cb467"
+SRC_URI[sha256sum] = "8361ff3c643fbd391064e97e5f54592ca28b880eaffbf566a68e0ad800d1a8ac"
 
 inherit autotools
 
-- 
2.27.0


--===============0340935042417649990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/help2man/help2man-dbg: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/help2man/help2man-dbg: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/help2man/help2man-dev: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/help2man/help2man-dev: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/help2man/help2man-doc: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/help2man/help2man-doc: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/help2man/help2man-locale: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/help2man/help2man-locale: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/help2man/help2man-src: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/help2man/help2man-src: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/help2man/help2man-staticdev: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/help2man/help2man-staticdev: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/help2man/help2man: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/help2man/help2man: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/help2man: PV changed from "1.48.2" to "1.48.3"
packages/core2-32-poky-linux/help2man: PKGV changed from 1.48.2 [default] to 1.48.3 [default]
packages/core2-32-poky-linux/help2man: SRC_URI changed from "https://ftp.gnu.org/gnu/help2man/help2man-1.48.2.tar.xz" to "https://ftp.gnu.org/gnu/help2man/help2man-1.48.3.tar.xz"

--===============0340935042417649990==--
