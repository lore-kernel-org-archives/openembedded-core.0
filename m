Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1292.1618510600131742405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 33FF138C13E1
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-gitdb: upgrading to 4.0.7 SUCCEEDED
Message-ID: <MADEUP.16761AD0FA4F2A73.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150521
Content-Type: multipart/mixed; boundary="===============4365675375177766526=="

--===============4365675375177766526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-gitdb* to *4.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-gitdb-upgrade-4.0.5-4.0.7.patch
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

--===============4365675375177766526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-gitdb (sysroot):
  /usr/lib/python3.9/site-packages/gitdb-4.0.5-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/gitdb-4.0.7-py3.9.egg-info

--===============4365675375177766526==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-gitdb-upgrade-4.0.5-4.0.7.patch"

From e74e31a6256e5855bc4c8e83e6a8f9b3b3a8250e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:18:20 +0000
Subject: [PATCH] python3-gitdb: upgrade 4.0.5 -> 4.0.7

---
 meta/recipes-devtools/python/python-gitdb.inc                   | 2 +-
 .../python/{python3-gitdb_4.0.5.bb => python3-gitdb_4.0.7.bb}   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-gitdb_4.0.5.bb => python3-gitdb_4.0.7.bb} (46%)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 618d85ff8d..53d925a495 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -8,7 +8,7 @@ inherit pypi
 
 PYPI_PACKAGE = "gitdb"
 
-SRC_URI[sha256sum] = "c9e1f2d0db7ddb9a704c2a0217be31214e91a4fe1dea1efad19ae42ba0c285c9"
+SRC_URI[sha256sum] = "96bf5c08b157a666fec41129e6d327235284cca4c81e92109260f353ba138005"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.5.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.7.bb
similarity index 46%
rename from meta/recipes-devtools/python/python3-gitdb_4.0.5.bb
rename to meta/recipes-devtools/python/python3-gitdb_4.0.7.bb
index fe56bf9640..2dcd9c8aff 100644
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.5.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.7.bb
@@ -1,4 +1,3 @@
 inherit setuptools3
 require python-gitdb.inc
 
-SRC_URI[md5sum] = "0e2d3f34efece5deda7c55fede6507cc"
-- 
2.27.0


--===============4365675375177766526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-gitdb: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-4.0.5.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitdb/gitdb-4.0.7.tar.gz"
packages/core2-32-poky-linux/python3-gitdb: PKGV changed from 4.0.5 [default] to 4.0.7 [default]
packages/core2-32-poky-linux/python3-gitdb: PV changed from "4.0.5" to "4.0.7"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dbg: PKGV changed from 4.0.5 [default] to 4.0.7 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dbg: PV changed from "4.0.5" to "4.0.7"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dev: PKGV changed from 4.0.5 [default] to 4.0.7 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-dev: PV changed from "4.0.5" to "4.0.7"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-doc: PKGV changed from 4.0.5 [default] to 4.0.7 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-doc: PV changed from "4.0.5" to "4.0.7"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-locale: PKGV changed from 4.0.5 [default] to 4.0.7 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-locale: PV changed from "4.0.5" to "4.0.7"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-src: PKGV changed from 4.0.5 [default] to 4.0.7 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-src: PV changed from "4.0.5" to "4.0.7"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-staticdev: PKGV changed from 4.0.5 [default] to 4.0.7 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb-staticdev: PV changed from "4.0.5" to "4.0.7"
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PKGSIZE changed from 321723 to 321886 (+0%)
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PKGV changed from 4.0.5 [default] to 4.0.7 [default]
packages/core2-32-poky-linux/python3-gitdb/python3-gitdb: PV changed from "4.0.5" to "4.0.7"
Changes to packages/core2-32-poky-linux/python3-gitdb (sysroot):
  /usr/lib/python3.9/site-packages/gitdb-4.0.5-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/gitdb-4.0.7-py3.9.egg-info

--===============4365675375177766526==--
