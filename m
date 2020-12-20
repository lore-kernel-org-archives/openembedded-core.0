Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.23885.1608473714120313526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id DC02338C1446
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] opkg: upgrading to 0.4.4 SUCCEEDED
Message-ID: <MADEUP.1652725254AFD5D4.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145939
Content-Type: multipart/mixed; boundary="===============1475632068664834063=="

--===============1475632068664834063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *opkg* to *0.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-opkg-upgrade-0.4.3-0.4.4.patch
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

--===============1475632068664834063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/opkg: SRC_URI changed from "http://downloads.yoctoproject.org/releases/opkg/opkg-0.4.3.tar.gz file://opkg.conf file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch file://run-ptest" to "http://downloads.yoctoproject.org/releases/opkg/opkg-0.4.4.tar.gz file://opkg.conf file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch file://run-ptest"
packages/core2-32-poky-linux/opkg: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/libopkg: PKGSIZE changed from 211376 to 211480 (+0%)
packages/core2-32-poky-linux/opkg/libopkg: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/libopkg: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/opkg-dbg: PKGSIZE changed from 526740 to 525560 (-0%)
packages/core2-32-poky-linux/opkg/opkg-dbg: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/opkg-dbg: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/opkg-dev: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/opkg-dev: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/opkg-doc: PKGSIZE changed from 14664 to 15236 (+4%)
packages/core2-32-poky-linux/opkg/opkg-doc: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/opkg-doc: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/opkg-locale: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/opkg-locale: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/opkg-ptest: PKGSIZE changed from 216514 to 184724 (-15%)
packages/core2-32-poky-linux/opkg/opkg-ptest: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/opkg-ptest: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/opkg-src: PKGSIZE changed from 511563 to 510881 (-0%)
packages/core2-32-poky-linux/opkg/opkg-src: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/opkg-src: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/opkg-staticdev: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/opkg-staticdev: PV changed from "0.4.3" to "0.4.4"
packages/core2-32-poky-linux/opkg/opkg: PKGSIZE changed from 30343 to 30295 (-0%)
packages/core2-32-poky-linux/opkg/opkg: PKGV changed from 0.4.3 [default] to 0.4.4 [default]
packages/core2-32-poky-linux/opkg/opkg: PV changed from "0.4.3" to "0.4.4"

--===============1475632068664834063==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-opkg-upgrade-0.4.3-0.4.4.patch"

From 72455f9dd2ddbb1b6af459d35474c29aee10a0c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 00:25:51 +0000
Subject: [PATCH] opkg: upgrade 0.4.3 -> 0.4.4

---
 meta/recipes-devtools/opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.4.3.bb => opkg_0.4.4.bb} (95%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.3.bb b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
similarity index 95%
rename from meta/recipes-devtools/opkg/opkg_0.4.3.bb
rename to meta/recipes-devtools/opkg/opkg_0.4.4.bb
index 46b7aa2523..078390f8ac 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
@@ -17,8 +17,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "86ec5eee9362aca0990994a402e077e9"
-SRC_URI[sha256sum] = "dda452854bc0cd1334f7ba18a66003d1c12a98600c894111b56919b1ea434718"
+SRC_URI[sha256sum] = "2217acc58b8eb31300631ebae75e222ebc700c9c1cf6408088705d19a472c839"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.20.1


--===============1475632068664834063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/opkg/opkg-ptest: PKGSIZE changed from 216514 to 184724 (-15%)

--===============1475632068664834063==--
