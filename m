Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.13115.1626600382221732765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7E24D38C1336
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 0.29.24 SUCCEEDED
Message-ID: <MADEUP.1692D86DFCE6B37A.32522@lists.openembedded.org>
X-Groupsio-MsgNum: 153965
Content-Type: multipart/mixed; boundary="===============4103295297438082573=="

--===============4103295297438082573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *0.29.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-0.29.23-0.29.24.patch
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

--===============4103295297438082573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.23.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.24.tar.gz"
packages/core2-32-poky-linux/python3-cython: PV changed from "0.29.23" to "0.29.24"
packages/core2-32-poky-linux/python3-cython: PKGV changed from 0.29.23 [default] to 0.29.24 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PV changed from "0.29.23" to "0.29.24"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 0.29.23 [default] to 0.29.24 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 7026152 to 7025656 (-0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PV changed from "0.29.23" to "0.29.24"
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 0.29.23 [default] to 0.29.24 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PV changed from "0.29.23" to "0.29.24"
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 0.29.23 [default] to 0.29.24 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PV changed from "0.29.23" to "0.29.24"
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 0.29.23 [default] to 0.29.24 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PV changed from "0.29.23" to "0.29.24"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGV changed from 0.29.23 [default] to 0.29.24 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8489141 to 8493025 (+0%)
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "0.29.23" to "0.29.24"
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 0.29.23 [default] to 0.29.24 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: PV changed from "0.29.23" to "0.29.24"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGV changed from 0.29.23 [default] to 0.29.24 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 8535959 to 8543104 (+0%)
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.9/site-packages/Cython-0.29.23-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Cython-0.29.24-py3.9.egg-info

--===============4103295297438082573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.9/site-packages/Cython-0.29.23-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Cython-0.29.24-py3.9.egg-info

--===============4103295297438082573==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-0.29.23-0.29.24.patch"

From 0bb6db37f7d46b1c050812d9882ff9e3cd082439 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 08:00:47 +0000
Subject: [PATCH] python3-cython: upgrade 0.29.23 -> 0.29.24

---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.23.bb => python3-cython_0.29.24.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.23.bb => python3-cython_0.29.24.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 04fd2ec2b7..c553ccb55a 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "6a0d31452f0245daacb14c979c77e093eb1a546c760816b5eed0047686baad8e"
+SRC_URI[sha256sum] = "cdf04d07c3600860e8c2ebaad4e8f52ac3feb212453c1764a49ac08c827e8443"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.23.bb b/meta/recipes-devtools/python/python3-cython_0.29.24.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.23.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.24.bb
-- 
2.27.0


--===============4103295297438082573==--
