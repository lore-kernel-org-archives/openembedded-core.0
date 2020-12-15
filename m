Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.868.1608060223398260149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id B276938C16CD
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:46 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 163 SUCCEEDED
Message-ID: <MADEUP.1650FA422A6D8CAF.1152@lists.openembedded.org>
X-Groupsio-MsgNum: 145732
Content-Type: multipart/mixed; boundary="===============2974687475982974989=="

--===============2974687475982974989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *163* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-161-163.patch
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

--===============2974687475982974989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (804 cached, 3 parsed). 1413 targets, 41 skipped, 0 masked, 0 errors.
Removing 138 recipes from the core2-32 sysroot...done.
Removing 142 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2974687475982974989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 161 [default] to 163 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "161" to "163"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 161 [default] to 163 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "161" to "163"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 161 [default] to 163 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "161" to "163"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 161 [default] to 163 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "161" to "163"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 161 [default] to 163 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "161" to "163"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 161 [default] to 163 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "161" to "163"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 161 [default] to 163 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 919459 to 923908 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "161" to "163"
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 161 [default] to 163 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-161.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-163.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "161" to "163"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info
  /usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py was added

--===============2974687475982974989==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-161-163.patch"

From 367bf1bb9507517d7bafd79c21a9e4ceaef391b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 18:45:51 +0000
Subject: [PATCH] diffoscope: upgrade 161 -> 163

---
 .../diffoscope/{diffoscope_161.bb => diffoscope_163.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_161.bb => diffoscope_163.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_161.bb b/meta/recipes-support/diffoscope/diffoscope_163.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_161.bb
rename to meta/recipes-support/diffoscope/diffoscope_163.bb
index 0f566a3ec7..2b66d628fd 100644
--- a/meta/recipes-support/diffoscope/diffoscope_161.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_163.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9c27d60a7bf3984b53c8af3fee86eb3d3e2292c4ddb9449c38b6cba068b8e22c"
+SRC_URI[sha256sum] = "1afeea6e383bdd2626a9e9b827ff487723c0de581d9f9f4d4f5fc9b65728662a"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.17.1


--===============2974687475982974989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info -> /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-161-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-163-py3.9.egg-info
  /usr/lib/python3.9/site-packages/diffoscope/comparators/__pycache__/uimage.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/diffoscope/comparators/uimage.py was added

--===============2974687475982974989==--
