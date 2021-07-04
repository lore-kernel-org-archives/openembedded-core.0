Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7504.1625391858741071332
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id DB82538C1280
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 2.1 SUCCEEDED
Message-ID: <MADEUP.168E8D48B04B0B4B.5985@lists.openembedded.org>
X-Groupsio-MsgNum: 153535
Content-Type: multipart/mixed; boundary="===============0276525406297889502=="

--===============0276525406297889502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-1.10-2.1.patch
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

--===============0276525406297889502==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-1.10-2.1.patch"

From 94a140f5206978528f679aa524a5bdb0d5c010af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 4 Jul 2021 08:53:34 +0000
Subject: [PATCH] hwlatdetect: upgrade 1.10 -> 2.1

---
 meta/recipes-rt/rt-tests/rt-tests.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index e97140add7..5ce4d298b9 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,7 +1,7 @@
-SRCREV = "c9051a36d934503b4673ca5615f631bae36dead0"
-PV = "1.10+git${SRCPV}"
+SRCREV = "667e1aae896f8448615b062d27c818b32cb960ff"
+PV = "2.1"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


--===============0276525406297889502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.1"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.1"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.1"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.1"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.1"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.1"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.1"
packages/core2-32-poky-linux/hwlatdetect: PKGV changed from 1.10+gitAUTOINC+c9051a36d9 [default] to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect: SRC_URI changed from "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest" to "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
packages/core2-32-poky-linux/hwlatdetect: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.1"

--===============0276525406297889502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 1.10+git0+c9051a36d9 to 2.1 [default]

--===============0276525406297889502==--
