Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5213.1613463849907542269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id B3D5238C0949
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:09 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.2.0 SUCCEEDED
Message-ID: <MADEUP.16642CD2B7F52DA6.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148113
Content-Type: multipart/mixed; boundary="===============8223727305960556741=="

--===============8223727305960556741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.0.2-6.2.0.patch
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

--===============8223727305960556741==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.0.2-6.2.0.patch"

From 015327211f88882c16b0d265ce62de9eeee1de31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 21:39:12 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.0.2 -> 6.2.0

---
 ...{python3-hypothesis_6.0.2.bb => python3-hypothesis_6.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.0.2.bb => python3-hypothesis_6.2.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
index fd163401a3..be9418386f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ae616551c8ebe897454e2de5183e325f6a109f70d45b7380154ed974ce8d4772"
+SRC_URI[sha256sum] = "c16fbde26b65c98a2464c48209b066c2f6dab5e8e38acd9d959021eb8d58b6c0"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.17.1


--===============8223727305960556741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info

--===============8223727305960556741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.0.2" to "6.2.0"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.0.2 [default] to 6.2.0 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.2.0.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.0.2 [default] to 6.2.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.0.2" to "6.2.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.0.2 [default] to 6.2.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.0.2" to "6.2.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.0.2 [default] to 6.2.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.0.2" to "6.2.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.0.2 [default] to 6.2.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.0.2" to "6.2.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.0.2 [default] to 6.2.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.0.2" to "6.2.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.0.2 [default] to 6.2.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.0.2" to "6.2.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1815227 to 1817876 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.0.2 [default] to 6.2.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.0.2" to "6.2.0"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info

--===============8223727305960556741==--
