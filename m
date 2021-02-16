Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5217.1613463848503672594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4AD7638C124A
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:09 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.13 SUCCEEDED
Message-ID: <MADEUP.16642CD295F083D9.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148112
Content-Type: multipart/mixed; boundary="===============7763361504415285944=="

--===============7763361504415285944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.12-3.1.13.patch
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

--===============7763361504415285944==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.12-3.1.13.patch"

From 3f5fc707f114f007d2aeca0c8f95e839360623de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 21:35:31 +0000
Subject: [PATCH] python3-git: upgrade 3.1.12 -> 3.1.13

---
 .../python/{python3-git_3.1.12.bb => python3-git_3.1.13.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.12.bb => python3-git_3.1.13.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.12.bb b/meta/recipes-devtools/python/python3-git_3.1.13.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.12.bb
rename to meta/recipes-devtools/python/python3-git_3.1.13.bb
index c0c460540d..807767e569 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.12.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.13.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "42dbefd8d9e2576c496ed0059f3103dcef7125b9ce16f9d5f9c834aed44a1dac"
+SRC_URI[sha256sum] = "8621a7e777e276a5ec838b59280ba5272dd144a18169c36c903d8b38b99f750a"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.17.1


--===============7763361504415285944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.9/site-packages/GitPython-3.1.12-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/GitPython-3.1.13-py3.9.egg-info

--===============7763361504415285944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.12 [default] to 3.1.13 [default]
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.12" to "3.1.13"
packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.12.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.13.tar.gz"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.12" to "3.1.13"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.12 [default] to 3.1.13 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.12" to "3.1.13"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.12 [default] to 3.1.13 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.12" to "3.1.13"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.12 [default] to 3.1.13 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.12" to "3.1.13"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.12 [default] to 3.1.13 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.12" to "3.1.13"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.12 [default] to 3.1.13 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.12" to "3.1.13"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.12 [default] to 3.1.13 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.12" to "3.1.13"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.12 [default] to 3.1.13 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 884126 to 884932 (+0%)
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.9/site-packages/GitPython-3.1.12-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/GitPython-3.1.13-py3.9.egg-info

--===============7763361504415285944==--
