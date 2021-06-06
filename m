Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.25789.1623000257718231785
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 17EB938C127B
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-libarchive-c: upgrading to 3.1 SUCCEEDED
Message-ID: <MADEUP.16860E22AE3CEB48.23614@lists.openembedded.org>
X-Groupsio-MsgNum: 152708
Content-Type: multipart/mixed; boundary="===============8262898796799315734=="

--===============8262898796799315734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-libarchive-c* to *3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-libarchive-c-upgrade-3.0-3.1.patch
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

--===============8262898796799315734==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-libarchive-c-upgrade-3.0-3.1.patch"

From a286b32e963cefd54b1c14b3ad795d279a19313c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 09:11:26 +0000
Subject: [PATCH] python3-libarchive-c: upgrade 3.0 -> 3.1

---
 ...python3-libarchive-c_3.0.bb => python3-libarchive-c_3.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_3.0.bb => python3-libarchive-c_3.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
index d29195545f..5e0f461271 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
@@ -9,8 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "920885f5910aa8245e30896996e0415b"
-SRC_URI[sha256sum] = "6f12fa9cf0e44579e5f45bbf11aa455a930fbfdb13ea0ce3c3dfe7b9b9a452ba"
+SRC_URI[sha256sum] = "618a7ecfbfb58ca15e11e3138d4a636498da3b6bc212811af158298530fbb87e"
 
 RDEPENDS_${PN} += "\
   libarchive \
-- 
2.17.1


--===============8262898796799315734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.9/site-packages/libarchive_c-3.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/libarchive_c-3.1-py3.9.egg-info

--===============8262898796799315734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-libarchive-c: PKGV changed from 3.0 [default] to 3.1 [default]
packages/core2-32-poky-linux/python3-libarchive-c: PV changed from "3.0" to "3.1"
packages/core2-32-poky-linux/python3-libarchive-c: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-3.1.tar.gz"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PKGV changed from 3.0 [default] to 3.1 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PV changed from "3.0" to "3.1"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PKGV changed from 3.0 [default] to 3.1 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PV changed from "3.0" to "3.1"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PKGV changed from 3.0 [default] to 3.1 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PV changed from "3.0" to "3.1"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PKGV changed from 3.0 [default] to 3.1 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PV changed from "3.0" to "3.1"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PKGV changed from 3.0 [default] to 3.1 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PV changed from "3.0" to "3.1"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PKGV changed from 3.0 [default] to 3.1 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PV changed from "3.0" to "3.1"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGV changed from 3.0 [default] to 3.1 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGSIZE changed from 68818 to 67758 (-2%)
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PV changed from "3.0" to "3.1"
Changes to packages/core2-32-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.9/site-packages/libarchive_c-3.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/libarchive_c-3.1-py3.9.egg-info

--===============8262898796799315734==--
