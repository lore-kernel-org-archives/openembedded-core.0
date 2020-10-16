Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12423.1602843683539497299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7A09538C1784
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] i2c-tools: upgrading to 4.2 SUCCEEDED
Message-ID: <MADEUP.163E71D68C3CAF58.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143431
Content-Type: multipart/mixed; boundary="===============2093039291844453512=="

--===============2093039291844453512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *i2c-tools* to *4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-i2c-tools-upgrade-4.1-4.2.patch
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

--===============2093039291844453512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/i2c-tools/i2c-tools-doc: PKGSIZE changed from 29839 to 36752 (+23%)

--===============2093039291844453512==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-i2c-tools-upgrade-4.1-4.2.patch"

From 1ce7f7e80db3a989e955e006cff9301edafcbe0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 03:11:39 +0000
Subject: [PATCH] i2c-tools: upgrade 4.1 -> 4.2

---
 .../i2c-tools/{i2c-tools_4.1.bb => i2c-tools_4.2.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.1.bb => i2c-tools_4.2.bb} (91%)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
similarity index 91%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
index c5761170aa..7a53151d0e 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "
 
-SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
-SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
+SRC_URI[sha256sum] = "7de18ed890e111fa54ab7ea896804d5faa4d1f0462a258aad9fbb7a8cc6b60cc"
 
 inherit update-alternatives
 
-- 
2.18.4


--===============2093039291844453512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/i2c-tools/i2c-tools-dbg: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools/i2c-tools-dbg: PV changed from "4.1" to "4.2"
packages/core2-32-poky-linux/i2c-tools/i2c-tools-dbg: PKGSIZE changed from 266408 to 268668 (+1%)
packages/core2-32-poky-linux/i2c-tools/i2c-tools-dev: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools/i2c-tools-dev: PV changed from "4.1" to "4.2"
packages/core2-32-poky-linux/i2c-tools/i2c-tools-doc: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools/i2c-tools-doc: PV changed from "4.1" to "4.2"
packages/core2-32-poky-linux/i2c-tools/i2c-tools-doc: PKGSIZE changed from 29839 to 36752 (+23%)
packages/core2-32-poky-linux/i2c-tools/i2c-tools-locale: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools/i2c-tools-locale: PV changed from "4.1" to "4.2"
packages/core2-32-poky-linux/i2c-tools/i2c-tools-misc: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools/i2c-tools-misc: PV changed from "4.1" to "4.2"
packages/core2-32-poky-linux/i2c-tools/i2c-tools-misc: PKGSIZE changed from 131551 to 140395 (+7%)
packages/core2-32-poky-linux/i2c-tools/i2c-tools-src: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools/i2c-tools-src: PV changed from "4.1" to "4.2"
packages/core2-32-poky-linux/i2c-tools/i2c-tools-src: PKGSIZE changed from 84306 to 85286 (+1%)
packages/core2-32-poky-linux/i2c-tools/i2c-tools-staticdev: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools/i2c-tools-staticdev: PV changed from "4.1" to "4.2"
packages/core2-32-poky-linux/i2c-tools/i2c-tools-staticdev: PKGSIZE changed from 16330 to 16334 (+0%)
packages/core2-32-poky-linux/i2c-tools/i2c-tools: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools/i2c-tools: PV changed from "4.1" to "4.2"
packages/core2-32-poky-linux/i2c-tools: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-32-poky-linux/i2c-tools: PV changed from "4.1" to "4.2"

--===============2093039291844453512==--
