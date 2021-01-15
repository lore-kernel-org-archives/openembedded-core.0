Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.688.1610713822595446391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 21E1438C12B7
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.12 SUCCEEDED
Message-ID: <MADEUP.165A67B02ABF49A3.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146763
Content-Type: multipart/mixed; boundary="===============8860955025254066702=="

--===============8860955025254066702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.11-3.1.12.patch
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

--===============8860955025254066702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.9/site-packages/GitPython-3.1.11-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/GitPython-3.1.12-py3.9.egg-info

--===============8860955025254066702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.11-3.1.12.patch"

From 5f87cb37576f8867e2fd5e2e560fd6f209d1700a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 05:44:28 +0000
Subject: [PATCH] python3-git: upgrade 3.1.11 -> 3.1.12

---
 .../python/{python3-git_3.1.11.bb => python3-git_3.1.12.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.11.bb => python3-git_3.1.12.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.11.bb b/meta/recipes-devtools/python/python3-git_3.1.12.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.11.bb
rename to meta/recipes-devtools/python/python3-git_3.1.12.bb
index 7c636572f3..c0c460540d 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.11.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.12.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "befa4d101f91bad1b632df4308ec64555db684c360bd7d2130b4807d49ce86b8"
+SRC_URI[sha256sum] = "42dbefd8d9e2576c496ed0059f3103dcef7125b9ce16f9d5f9c834aed44a1dac"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.27.0


--===============8860955025254066702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.11.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.12.tar.gz"
packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.11 [default] to 3.1.12 [default]
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.11" to "3.1.12"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.11 [default] to 3.1.12 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.11" to "3.1.12"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.11 [default] to 3.1.12 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.11" to "3.1.12"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.11 [default] to 3.1.12 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.11" to "3.1.12"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.11 [default] to 3.1.12 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.11" to "3.1.12"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.11 [default] to 3.1.12 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.11" to "3.1.12"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.11 [default] to 3.1.12 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.11" to "3.1.12"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.11 [default] to 3.1.12 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 881971 to 884126 (+0%)
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.11" to "3.1.12"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.9/site-packages/GitPython-3.1.11-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/GitPython-3.1.12-py3.9.egg-info

--===============8860955025254066702==--
