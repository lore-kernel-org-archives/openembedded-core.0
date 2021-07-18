Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.13218.1626600382223520703
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8422338C1355
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.14.3 SUCCEEDED
Message-ID: <MADEUP.1692D86DFBBF4389.12794@lists.openembedded.org>
X-Groupsio-MsgNum: 153963
Content-Type: multipart/mixed; boundary="===============9060663307856731827=="

--===============9060663307856731827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.14.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.14.1-6.14.3.patch
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

--===============9060663307856731827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.14.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.14.3.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.14.1 [default] to 6.14.3 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.14.1" to "6.14.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.14.1 [default] to 6.14.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.14.1" to "6.14.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.14.1 [default] to 6.14.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.14.1" to "6.14.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.14.1 [default] to 6.14.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.14.1" to "6.14.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.14.1 [default] to 6.14.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.14.1" to "6.14.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.14.1 [default] to 6.14.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.14.1" to "6.14.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.14.1 [default] to 6.14.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.14.1" to "6.14.3"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1883658 to 1883703 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.14.1 [default] to 6.14.3 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.14.1" to "6.14.3"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.14.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.14.3-py3.9.egg-info

--===============9060663307856731827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.14.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.14.3-py3.9.egg-info

--===============9060663307856731827==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.14.1-6.14.3.patch"

From 6ea3b968ca392606b00c69ac19b0e615ab01bb71 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 08:03:21 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.14.1 -> 6.14.3

---
 ...ython3-hypothesis_6.14.1.bb => python3-hypothesis_6.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.14.1.bb => python3-hypothesis_6.14.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb
index 61598c3a16..83c9917a04 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.14.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.14.3.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "88b0736a5691b68b8e16a4b7ee8e4c8596810c5a20989ea5b5f64870a7c25740"
+SRC_URI[sha256sum] = "1c8776d9fc8c598cf1b93b99bd87976f9d9b589fc58843d85a30090700f14a8a"
 
 RDEPENDS_${PN} += " \
     python3-attrs \
-- 
2.27.0


--===============9060663307856731827==--
