Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.32527.1624189110577784587
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id A0E8338C1186
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.18 SUCCEEDED
Message-ID: <MADEUP.168A47640FBA57D2.8577@lists.openembedded.org>
X-Groupsio-MsgNum: 153109
Content-Type: multipart/mixed; boundary="===============1773007657132917602=="

--===============1773007657132917602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.17-3.1.18.patch
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

--===============1773007657132917602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.17 [default] to 3.1.18 [default]
packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.17.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.18.tar.gz"
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.17" to "3.1.18"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.17 [default] to 3.1.18 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.17" to "3.1.18"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.17 [default] to 3.1.18 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.17" to "3.1.18"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.17 [default] to 3.1.18 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.17" to "3.1.18"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.17 [default] to 3.1.18 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.17" to "3.1.18"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.17 [default] to 3.1.18 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.17" to "3.1.18"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.17 [default] to 3.1.18 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.17" to "3.1.18"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.17 [default] to 3.1.18 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 934684 to 955569 (+2%)
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.17" to "3.1.18"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/GitPython-3.1.18-py3.9.egg-info

--===============1773007657132917602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/GitPython-3.1.18-py3.9.egg-info

--===============1773007657132917602==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.17-3.1.18.patch"

From bb00dcc14282b346e552953c4330fc0aa9e52190 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 08:57:16 +0000
Subject: [PATCH] python3-git: upgrade 3.1.17 -> 3.1.18

---
 .../python/{python3-git_3.1.17.bb => python3-git_3.1.18.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.17.bb => python3-git_3.1.18.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.17.bb b/meta/recipes-devtools/python/python3-git_3.1.18.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.17.bb
rename to meta/recipes-devtools/python/python3-git_3.1.18.bb
index 009cac6609..955418c0e4 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.17.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.18.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ee24bdc93dce357630764db659edaf6b8d664d4ff5447ccfeedd2dc5c253f41e"
+SRC_URI[sha256sum] = "b838a895977b45ab6f0cc926a9045c8d1c44e2b653c1fcc39fe91f42c6e8f05b"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.20.1


--===============1773007657132917602==--
