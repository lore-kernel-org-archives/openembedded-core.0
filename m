Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.670.1610713822345095817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7F9C638C08B1
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot-tools: upgrading to 2021.01 SUCCEEDED
Message-ID: <MADEUP.165A67B0064BED5E.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146744
Content-Type: multipart/mixed; boundary="===============1296386625243013650=="

--===============1296386625243013650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot-tools* to *2021.01* has Succeeded.

Next steps:
    - apply the patch: git am 0001-u-boot-tools-upgrade-2020.10-2021.01.patch
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

--===============1296386625243013650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-u-boot-tools-upgrade-2020.10-2021.01.patch"

From d52498ff0b94f57ee4dcb855e1f96f9414066221 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 02:58:48 +0000
Subject: [PATCH] u-boot-tools: upgrade 2020.10 -> 2021.01

---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2020.10.bb => u-boot-tools_2021.01.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.10.bb => u-boot-tools_2021.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index cbce408a28..5a8035f432 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
+SRCREV = "c4fddedc48f336eabc4ce3f74940e6aa372de18c"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2021.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2021.01.bb
-- 
2.27.0


--===============1296386625243013650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/u-boot-tools: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dbg: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dbg: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dbg: PKGSIZE changed from 3374576 to 3387892 (+0%)
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dev: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dev: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-doc: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-doc: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-locale: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-locale: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkenvimage: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkenvimage: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkimage: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkimage: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkimage: PKGSIZE changed from 925912 to 938200 (+1%)
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-src: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-src: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-src: PKGSIZE changed from 1057699 to 1063156 (+1%)
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-staticdev: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-staticdev: PV changed from "2020.10" to "2021.01"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools: PKGV changed from 2020.10 [default] to 2021.01 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools: PV changed from "2020.10" to "2021.01"

--===============1296386625243013650==--
