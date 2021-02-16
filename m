Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5173.1613463850169632873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0D22838C1276
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 8.7.0 SUCCEEDED
Message-ID: <MADEUP.16642CD2C647C656.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148115
Content-Type: multipart/mixed; boundary="===============0582311403005895771=="

--===============0582311403005895771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-more-itertools* to *8.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-8.6.0-8.7.0.patch
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

--===============0582311403005895771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.9/site-packages/more_itertools-8.6.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/more_itertools-8.7.0-py3.9.egg-info

--===============0582311403005895771==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-8.6.0-8.7.0.patch"

From 301806226bbb9fcd884526298e9b6f532cacd63a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 21:50:01 +0000
Subject: [PATCH] python3-more-itertools: upgrade 8.6.0 -> 8.7.0

---
 ...-more-itertools_8.6.0.bb => python3-more-itertools_8.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.6.0.bb => python3-more-itertools_8.7.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb
index ee5ce7ba9c..0cb61915bf 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "b3a9005928e5bed54076e6e549c792b306fddfe72b2d1d22dd63d42d5d3899cf"
+SRC_URI[sha256sum] = "c5d6da9ca3ff65220c3bfd2a8db06d698f05d4d2b9be57e1deb2be5a45019713"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1


--===============0582311403005895771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-more-itertools: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-8.6.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-8.7.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 162136 to 170883 (+5%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "8.6.0" to "8.7.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 8.6.0 [default] to 8.7.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 286372 to 304751 (+6%)
Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.9/site-packages/more_itertools-8.6.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/more_itertools-8.7.0-py3.9.egg-info

--===============0582311403005895771==--
