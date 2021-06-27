Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5820.1624805202747747889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0E1FD38C12CE
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:42 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 2.0 SUCCEEDED
Message-ID: <MADEUP.168C77B931BC82EE.29174@lists.openembedded.org>
X-Groupsio-MsgNum: 153313
Content-Type: multipart/mixed; boundary="===============4778174691571690305=="

--===============4778174691571690305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-1.10-2.0.patch
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

--===============4778174691571690305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]

--===============4778174691571690305==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-1.10-2.0.patch"

From 9c05444a920e776a389c62c8ed00790cfb8e03cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 13:42:26 +0000
Subject: [PATCH] hwlatdetect: upgrade 1.10 -> 2.0

---
 meta/recipes-rt/rt-tests/rt-tests.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index e97140add7..b729d05c96 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,7 +1,7 @@
-SRCREV = "c9051a36d934503b4673ca5615f631bae36dead0"
-PV = "1.10+git${SRCPV}"
+SRCREV = "3014bb16ebeaee63fee5ced7bf80d4faa9711eb4"
+PV = "2.0"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


--===============4778174691571690305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.0"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.0"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.0"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.0"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.0"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.0"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.0"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 1.10+git0+c9051a36d9 to 2.0 [default]
packages/core2-32-poky-linux/hwlatdetect: SRC_URI changed from "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest" to "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
packages/core2-32-poky-linux/hwlatdetect: PV changed from "1.10+gitAUTOINC+c9051a36d9" to "2.0"
packages/core2-32-poky-linux/hwlatdetect: PKGV changed from 1.10+gitAUTOINC+c9051a36d9 [default] to 2.0 [default]

--===============4778174691571690305==--
