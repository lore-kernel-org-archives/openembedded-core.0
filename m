Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.24455.1608473714802232770
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id DE27038C144B
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 5.43.3 SUCCEEDED
Message-ID: <MADEUP.1652725259360C4C.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145940
Content-Type: multipart/mixed; boundary="===============7264393139643542217=="

--===============7264393139643542217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *5.43.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-5.41.5-5.43.3.patch
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

--===============7264393139643542217==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-5.41.5-5.43.3.patch"

From 7543b04887bf75405a1ac812a835e3d9c5730f7b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 00:29:28 +0000
Subject: [PATCH] python3-hypothesis: upgrade 5.41.5 -> 5.43.3

---
 ...ython3-hypothesis_5.41.5.bb => python3-hypothesis_5.43.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_5.41.5.bb => python3-hypothesis_5.43.3.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb b/meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
index 7ad975b62a..4d93cba868 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a74e127a865fde12b853cc00f5f52a3a1601d2a1c311b3ffc8de92a4c06778f7"
+SRC_URI[sha256sum] = "d97ba7ae2cfe7096b0c045fdb611ee9850ccdd6050a9b36cb96812242062c2cc"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.20.1


--===============7264393139643542217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "5.41.5" to "5.43.3"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 5.41.5 [default] to 5.43.3 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-5.41.5.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-5.43.3.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "5.41.5" to "5.43.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 5.41.5 [default] to 5.43.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "5.41.5" to "5.43.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 5.41.5 [default] to 5.43.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "5.41.5" to "5.43.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 5.41.5 [default] to 5.43.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "5.41.5" to "5.43.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 5.41.5 [default] to 5.43.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "5.41.5" to "5.43.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 5.41.5 [default] to 5.43.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "5.41.5" to "5.43.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 5.41.5 [default] to 5.43.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1766127 to 1783895 (+1%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "5.41.5" to "5.43.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 5.41.5 [default] to 5.43.3 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-5.41.5-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info

--===============7264393139643542217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-5.41.5-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info

--===============7264393139643542217==--
