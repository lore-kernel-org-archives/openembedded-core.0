Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.690.1610713822970266237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 25AA638C12CE
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.0.2 SUCCEEDED
Message-ID: <MADEUP.165A67B02CFC911A.4055@lists.openembedded.org>
X-Groupsio-MsgNum: 146765
Content-Type: multipart/mixed; boundary="===============6188947967283611646=="

--===============6188947967283611646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-5.43.3-6.0.2.patch
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

--===============6188947967283611646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py /usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py /usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py /usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py /usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py /usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/entry_points.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/not-zip-safe was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py was added
  /usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/entry_points.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/not-zip-safe was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/top_level.txt was removed

--===============6188947967283611646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-5.43.3-6.0.2.patch"

From 11e492964492b492e37c40d98fc286c232b5e177 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 05:47:27 +0000
Subject: [PATCH] python3-hypothesis: upgrade 5.43.3 -> 6.0.2

---
 ...python3-hypothesis_5.43.3.bb => python3-hypothesis_6.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_5.43.3.bb => python3-hypothesis_6.0.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
index 4d93cba868..fd163401a3 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d97ba7ae2cfe7096b0c045fdb611ee9850ccdd6050a9b36cb96812242062c2cc"
+SRC_URI[sha256sum] = "ae616551c8ebe897454e2de5183e325f6a109f70d45b7380154ed974ce8d4772"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.27.0


--===============6188947967283611646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "5.43.3" to "6.0.2"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 5.43.3 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-5.43.3.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.0.2.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "5.43.3" to "6.0.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 5.43.3 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "5.43.3" to "6.0.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 5.43.3 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "5.43.3" to "6.0.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 5.43.3 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "5.43.3" to "6.0.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 5.43.3 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "5.43.3" to "6.0.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 5.43.3 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "5.43.3" to "6.0.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 5.43.3 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "5.43.3" to "6.0.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 5.43.3 [default] to 6.0.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1783895 to 1815227 (+2%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/entry_points.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/not-zip-safe was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.0.2-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/hypothesis/extra/codemods.py was added
  /usr/lib/python3.9/site-packages/hypothesis/extra/__pycache__/codemods.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/entry_points.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/not-zip-safe was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-5.43.3-py3.9.egg-info/top_level.txt was removed

--===============6188947967283611646==--
