Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.23883.1608473713770940193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7F7C738C1364
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] init-system-helpers: upgrading to 1.60 SUCCEEDED
Message-ID: <MADEUP.1652725219DBE6CD.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145918
Content-Type: multipart/mixed; boundary="===============1942942317786797134=="

--===============1942942317786797134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *init-system-helpers* to *1.60* has Succeeded.

Next steps:
    - apply the patch: git am 0001-init-system-helpers-upgrade-1.58-1.60.patch
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

--===============1942942317786797134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dbg: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dbg: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dev: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dev: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-doc: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-doc: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PKGSIZE changed from 17042 to 16507 (-3%)
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-locale: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-locale: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PKGSIZE changed from 9269 to 9104 (-2%)
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-src: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-src: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-staticdev: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-staticdev: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers: PKGV changed from 1.58 [default] to 1.60 [default]
packages/core2-32-poky-linux/init-system-helpers: PV changed from "1.58" to "1.60"
packages/core2-32-poky-linux/init-system-helpers: PKGV changed from 1.58 [default] to 1.60 [default]

--===============1942942317786797134==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-init-system-helpers-upgrade-1.58-1.60.patch"

From 29b150b95ef5379848c92360b07b21ffd5db7613 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 19 Dec 2020 21:24:59 +0000
Subject: [PATCH] init-system-helpers: upgrade 1.58 -> 1.60

---
 ...{init-system-helpers_1.58.bb => init-system-helpers_1.60.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.58.bb => init-system-helpers_1.60.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.58.bb b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.58.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.60.bb
index b591f412c6..33977e66c1 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.58.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
-SRCREV = "6a1860c6f5ad295af605ddf588933544e7c24ce1"
+SRCREV = "dbd9197569c0935029acd5c9b02b84c68fd937ee"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


--===============1942942317786797134==--
