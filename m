Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.39495.1605551304053546571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2E5FC38C1292
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex: upgrading to 3.9.9 SUCCEEDED
Message-ID: <MADEUP.16481067921EDB69.27635@lists.openembedded.org>
X-Groupsio-MsgNum: 144644
Content-Type: multipart/mixed; boundary="===============0068275557462630809=="

--===============0068275557462630809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodomex* to *3.9.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-upgrade-3.9.8-3.9.9.patch
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

--===============0068275557462630809==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-upgrade-3.9.8-3.9.9.patch"

From 09cdda3af4411f8b7dfc12e53e64ea297e9f0bf4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 14:40:05 +0000
Subject: [PATCH] python3-pycryptodomex: upgrade 3.9.8 -> 3.9.9

---
 ...n3-pycryptodomex_3.9.8.bb => python3-pycryptodomex_3.9.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.9.8.bb => python3-pycryptodomex_3.9.9.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb
index 035c7fa636..abff71efdd 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "48cc2cfc251f04a6142badeb666d1ff49ca6fdfc303fd72579f62b768aaa52b9"
+SRC_URI[sha256sum] = "7b5b7c5896f8172ea0beb283f7f9428e0ab88ec248ce0a5b8c98d73e26267d51"
 
 FILES_${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.20.1


--===============0068275557462630809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.9/site-packages/pycryptodomex-3.9.8-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/pycryptodomex-3.9.9-py3.9.egg-info

--===============0068275557462630809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodomex: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.9.8.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.9.9.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodomex: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 34085817 to 34085905 (+0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.9.8" to "3.9.9"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3057028 to 3057431 (+0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.9.8 [default] to 3.9.9 [default]
Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.9/site-packages/pycryptodomex-3.9.8-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/pycryptodomex-3.9.9-py3.9.egg-info

--===============0068275557462630809==--
