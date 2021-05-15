Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.4497.1621074783901288369
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4544C38C139D
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 6.2.4 SUCCEEDED
Message-ID: <MADEUP.167F36ED73483D75.8202@lists.openembedded.org>
X-Groupsio-MsgNum: 151800
Content-Type: multipart/mixed; boundary="===============0334601285199284673=="

--===============0334601285199284673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *6.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-6.2.3-6.2.4.patch
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

--===============0334601285199284673==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-6.2.3-6.2.4.patch"

From 8bc3a78c359795399775faebed9fe672f6542557 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 05:11:31 +0000
Subject: [PATCH] python3-pytest: upgrade 6.2.3 -> 6.2.4

---
 .../python/{python3-pytest_6.2.3.bb => python3-pytest_6.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_6.2.3.bb => python3-pytest_6.2.4.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.3.bb b/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_6.2.3.bb
rename to meta/recipes-devtools/python/python3-pytest_6.2.4.bb
index 7fb7baf188..fa43e6ebf0 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.3.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
-SRC_URI[sha256sum] = "671238a46e4df0f3498d1c3270e5deb9b32d25134c99b7d75370a68cfbe9b634"
+SRC_URI[sha256sum] = "50bcad0a0b9c5a72c8e4e7c9855a3ad496ca6a881a3641b4260605450772c54b"
 
 inherit update-alternatives pypi setuptools3
 
-- 
2.27.0


--===============0334601285199284673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: PKGV changed from 6.2.3 [default] to 6.2.4 [default]
packages/core2-32-poky-linux/python3-pytest: PV changed from "6.2.3" to "6.2.4"
packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-6.2.3.tar.gz file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-6.2.4.tar.gz file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 6.2.3 [default] to 6.2.4 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "6.2.3" to "6.2.4"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 6.2.3 [default] to 6.2.4 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "6.2.3" to "6.2.4"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 6.2.3 [default] to 6.2.4 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "6.2.3" to "6.2.4"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 6.2.3 [default] to 6.2.4 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "6.2.3" to "6.2.4"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 6.2.3 [default] to 6.2.4 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "6.2.3" to "6.2.4"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 6.2.3 [default] to 6.2.4 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "6.2.3" to "6.2.4"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 6.2.3 [default] to 6.2.4 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 1804361 to 1804975 (+0%)
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "6.2.3" to "6.2.4"

--===============0334601285199284673==--
