Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.6805.1622200976180403964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4DF1838C1360
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.13.7 SUCCEEDED
Message-ID: <MADEUP.1683373172EAFCCA.665@lists.openembedded.org>
X-Groupsio-MsgNum: 152347
Content-Type: multipart/mixed; boundary="===============5843054377290446675=="

--===============5843054377290446675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.13.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.12.0-6.13.7.patch
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

--===============5843054377290446675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.12.0 [default] to 6.13.7 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.12.0" to "6.13.7"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.12.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.13.7.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.12.0 [default] to 6.13.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.12.0" to "6.13.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.12.0 [default] to 6.13.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.12.0" to "6.13.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.12.0 [default] to 6.13.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.12.0" to "6.13.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.12.0 [default] to 6.13.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.12.0" to "6.13.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.12.0 [default] to 6.13.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.12.0" to "6.13.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.12.0 [default] to 6.13.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.12.0" to "6.13.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.12.0 [default] to 6.13.7 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.12.0" to "6.13.7"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1880414 to 1885361 (+0%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.12.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info

--===============5843054377290446675==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.12.0-6.13.7.patch"

From df1bb0591bc2d9f176006912765a9b25f706c14b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 08:22:42 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.12.0 -> 6.13.7

---
 ...ython3-hypothesis_6.12.0.bb => python3-hypothesis_6.13.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.12.0.bb => python3-hypothesis_6.13.7.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
index a8a749cd16..7688ff6d18 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a24b2ccb7b84860762df3fabb8faa196bf627cbee62917a5095f3de8ff71050b"
+SRC_URI[sha256sum] = "262bb8cee0293ad06c453e78cf89bddcb613b91f82ea5587f3787611ee62861b"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.27.0


--===============5843054377290446675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.12.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info

--===============5843054377290446675==--
