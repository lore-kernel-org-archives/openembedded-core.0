Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5171.1613463848621642100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1679038C128A
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:11 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pigz: upgrading to 2.6 SUCCEEDED
Message-ID: <MADEUP.16642CD3004BE274.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148128
Content-Type: multipart/mixed; boundary="===============9187718591313916830=="

--===============9187718591313916830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pigz* to *2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pigz-upgrade-2.4-2.6.patch
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

--===============9187718591313916830==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-pigz-upgrade-2.4-2.6.patch"

From c1c6220d7e672c294d441d91ab661203b119b6a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 23:14:30 +0000
Subject: [PATCH] pigz: upgrade 2.4 -> 2.6

---
 meta/recipes-extended/pigz/{pigz_2.4.bb => pigz_2.6.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/pigz/{pigz_2.4.bb => pigz_2.6.bb} (91%)

diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-extended/pigz/pigz_2.6.bb
similarity index 91%
rename from meta/recipes-extended/pigz/pigz_2.4.bb
rename to meta/recipes-extended/pigz/pigz_2.6.bb
index 8c65ec34f0..05be9b733f 100644
--- a/meta/recipes-extended/pigz/pigz_2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.6.bb
@@ -9,8 +9,7 @@ LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
-SRC_URI[md5sum] = "def2f6e19d9d8231445adc1349d346df"
-SRC_URI[sha256sum] = "a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73"
+SRC_URI[sha256sum] = "2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d"
 PROVIDES_class-native += "gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
-- 
2.17.1


--===============9187718591313916830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pigz: PV changed from "2.4" to "2.6"
packages/core2-32-poky-linux/pigz: SRC_URI changed from "http://zlib.net/pigz/fossils/pigz-2.4.tar.gz" to "http://zlib.net/pigz/fossils/pigz-2.6.tar.gz"
packages/core2-32-poky-linux/pigz: PKGV changed from 2.4 [default] to 2.6 [default]
packages/core2-32-poky-linux/pigz/pigz-dbg: PKGSIZE changed from 306300 to 320956 (+5%)
packages/core2-32-poky-linux/pigz/pigz-dbg: PV changed from "2.4" to "2.6"
packages/core2-32-poky-linux/pigz/pigz-dbg: PKGV changed from 2.4 [default] to 2.6 [default]
packages/core2-32-poky-linux/pigz/pigz-dev: PV changed from "2.4" to "2.6"
packages/core2-32-poky-linux/pigz/pigz-dev: PKGV changed from 2.4 [default] to 2.6 [default]
packages/core2-32-poky-linux/pigz/pigz-doc: PV changed from "2.4" to "2.6"
packages/core2-32-poky-linux/pigz/pigz-doc: PKGV changed from 2.4 [default] to 2.6 [default]
packages/core2-32-poky-linux/pigz/pigz-locale: PV changed from "2.4" to "2.6"
packages/core2-32-poky-linux/pigz/pigz-locale: PKGV changed from 2.4 [default] to 2.6 [default]
packages/core2-32-poky-linux/pigz/pigz-src: PKGSIZE changed from 334407 to 357736 (+7%)
packages/core2-32-poky-linux/pigz/pigz-src: PV changed from "2.4" to "2.6"
packages/core2-32-poky-linux/pigz/pigz-src: PKGV changed from 2.4 [default] to 2.6 [default]
packages/core2-32-poky-linux/pigz/pigz-staticdev: PV changed from "2.4" to "2.6"
packages/core2-32-poky-linux/pigz/pigz-staticdev: PKGV changed from 2.4 [default] to 2.6 [default]
packages/core2-32-poky-linux/pigz/pigz: PKGSIZE changed from 132620 to 144908 (+9%)
packages/core2-32-poky-linux/pigz/pigz: PV changed from "2.4" to "2.6"
packages/core2-32-poky-linux/pigz/pigz: PKGV changed from 2.4 [default] to 2.6 [default]

--===============9187718591313916830==--
