Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.4690.1621074783788318693
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1BED738C1377
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.17 SUCCEEDED
Message-ID: <MADEUP.167F36ED590FCA66.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151794
Content-Type: multipart/mixed; boundary="===============3842799694583989540=="

--===============3842799694583989540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.14-3.1.17.patch
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

--===============3842799694583989540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-git/python3-git-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc /usr/lib/python3.9/site-packages/git/types.py"
packages/core2-32-poky-linux/python3-git/python3-git-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc /usr/lib/python3.9/site-packages/git/types.py"
packages/core2-32-poky-linux/python3-git/python3-git-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc /usr/lib/python3.9/site-packages/git/types.py"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc /usr/lib/python3.9/site-packages/git/types.py"
packages/core2-32-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc /usr/lib/python3.9/site-packages/git/types.py"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info
  /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/git/types.py was added

--===============3842799694583989540==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.14-3.1.17.patch"

From 1e5fe2bee95e9209b63843b94b1e7f17b5d716eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 04:57:37 +0000
Subject: [PATCH] python3-git: upgrade 3.1.14 -> 3.1.17

---
 .../python/{python3-git_3.1.14.bb => python3-git_3.1.17.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.14.bb => python3-git_3.1.17.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.14.bb b/meta/recipes-devtools/python/python3-git_3.1.17.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.14.bb
rename to meta/recipes-devtools/python/python3-git_3.1.17.bb
index 911c8f1487..009cac6609 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.14.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.17.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "be27633e7509e58391f10207cd32b2a6cf5b908f92d9cd30da2e514e1137af61"
+SRC_URI[sha256sum] = "ee24bdc93dce357630764db659edaf6b8d664d4ff5447ccfeedd2dc5c253f41e"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.27.0


--===============3842799694583989540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.14.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.17.tar.gz"
packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.14 [default] to 3.1.17 [default]
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.14" to "3.1.17"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.14 [default] to 3.1.17 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/types.py /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.14" to "3.1.17"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.14 [default] to 3.1.17 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/types.py /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.14" to "3.1.17"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.14 [default] to 3.1.17 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/types.py /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.14" to "3.1.17"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.14 [default] to 3.1.17 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/types.py /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.14" to "3.1.17"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.14 [default] to 3.1.17 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/types.py /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc"
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.14" to "3.1.17"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.14 [default] to 3.1.17 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/types.py /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.14" to "3.1.17"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.14 [default] to 3.1.17 [default]
packages/core2-32-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info -> /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/git/types.py /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc"
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.14" to "3.1.17"
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 886896 to 934651 (+5%)
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.9/site-packages/GitPython-3.1.14-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/GitPython-3.1.17-py3.9.egg-info
  /usr/lib/python3.9/site-packages/git/__pycache__/types.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/git/types.py was added

--===============3842799694583989540==--
