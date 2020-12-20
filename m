Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.24455.1608473714802232770
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id D79FF38C1574
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libusb1: upgrading to 1.0.24 SUCCEEDED
Message-ID: <MADEUP.165272530044B147.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145978
Content-Type: multipart/mixed; boundary="===============8903842962288004922=="

--===============8903842962288004922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libusb1* to *1.0.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libusb1-upgrade-1.0.23-1.0.24.patch
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

--===============8903842962288004922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libusb1: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1: SRC_URI changed from "https://downloads.sourceforge.net/libusb/libusb-1.0.23.tar.bz2 file://run-ptest" to "https://downloads.sourceforge.net/libusb/libusb-1.0.24.tar.bz2 file://run-ptest"
packages/core2-32-poky-linux/libusb1/libusb1-dbg: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1/libusb1-dbg: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1/libusb1-dbg: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-dbg: PKGSIZE changed from 294964 to 308904 (+5%)
packages/core2-32-poky-linux/libusb1/libusb1-dev: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1/libusb1-dev: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1/libusb1-dev: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-dev: PKGSIZE changed from 74144 to 75583 (+2%)
packages/core2-32-poky-linux/libusb1/libusb1-doc: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1/libusb1-doc: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1/libusb1-doc: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-locale: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1/libusb1-locale: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1/libusb1-locale: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-ptest: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1/libusb1-ptest: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1/libusb1-ptest: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-src: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1/libusb1-src: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1/libusb1-src: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-src: PKGSIZE changed from 505659 to 519585 (+3%)
packages/core2-32-poky-linux/libusb1/libusb1-staticdev: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1/libusb1-staticdev: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1/libusb1-staticdev: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1: PKGV changed from 1.0.23 [default] to 1.0.24 [default]
packages/core2-32-poky-linux/libusb1/libusb1: PV changed from "1.0.23" to "1.0.24"
packages/core2-32-poky-linux/libusb1/libusb1: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1: PKGSIZE changed from 116075 to 124267 (+7%)
Changes to packages/core2-32-poky-linux/libusb1 (sysroot):
  /lib/libusb-1.0.so.0 changed symlink target from libusb-1.0.so.0.2.0 to libusb-1.0.so.0.3.0
  /lib/libusb-1.0.so changed symlink target from libusb-1.0.so.0.2.0 to libusb-1.0.so.0.3.0
  /lib/libusb-1.0.so.0.2.0 moved to /lib/libusb-1.0.so.0.3.0

--===============8903842962288004922==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libusb1-upgrade-1.0.23-1.0.24.patch"

From b5e16114c2ce1f61be362b4c2cfb32401c98e309 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 13:52:47 +0000
Subject: [PATCH] libusb1: upgrade 1.0.23 -> 1.0.24

---
 .../libusb/{libusb1_1.0.23.bb => libusb1_1.0.24.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.23.bb => libusb1_1.0.24.bb} (90%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.23.bb b/meta/recipes-support/libusb/libusb1_1.0.24.bb
similarity index 90%
rename from meta/recipes-support/libusb/libusb1_1.0.23.bb
rename to meta/recipes-support/libusb/libusb1_1.0.24.bb
index 2fd658b4ef..4c552ae6c7 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.23.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.24.bb
@@ -12,8 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
            file://run-ptest \
           "
 
-SRC_URI[md5sum] = "be79ed4a4a440169deec8beaac6aae33"
-SRC_URI[sha256sum] = "4fc17b2ef3502757641bf8fe2c14ad86ec86302a2b785abcb0806fd03aa1201f"
+SRC_URI[sha256sum] = "7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.20.1


--===============8903842962288004922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libusb1/libusb1-dev: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-doc: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-locale: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-ptest: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1-staticdev: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
packages/core2-32-poky-linux/libusb1/libusb1: FILELIST: removed "/lib/libusb-1.0.so.0.2.0", added "/lib/libusb-1.0.so.0.3.0"
Changes to packages/core2-32-poky-linux/libusb1 (sysroot):
  /lib/libusb-1.0.so.0 changed symlink target from libusb-1.0.so.0.2.0 to libusb-1.0.so.0.3.0
  /lib/libusb-1.0.so changed symlink target from libusb-1.0.so.0.2.0 to libusb-1.0.so.0.3.0
  /lib/libusb-1.0.so.0.2.0 moved to /lib/libusb-1.0.so.0.3.0

--===============8903842962288004922==--
