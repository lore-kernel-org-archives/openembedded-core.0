Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7586.1625391858419585365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id A6F4338C11D0
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 21.0 SUCCEEDED
Message-ID: <MADEUP.168E8D489CFCBC09.2482@lists.openembedded.org>
X-Groupsio-MsgNum: 153522
Content-Type: multipart/mixed; boundary="===============1009355936848042540=="

--===============1009355936848042540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-packaging* to *21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-20.9-21.0.patch
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

--===============1009355936848042540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-packaging: PV changed from "20.9" to "21.0"
packages/core2-32-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-20.9.tar.gz" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-21.0.tar.gz"
packages/core2-32-poky-linux/python3-packaging: PKGV changed from 20.9 [default] to 21.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_typing.py /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/_musllinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "20.9" to "21.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 20.9 [default] to 21.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_typing.py /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/_musllinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "20.9" to "21.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 20.9 [default] to 21.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_typing.py /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/_musllinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "20.9" to "21.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 20.9 [default] to 21.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_typing.py /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/_musllinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "20.9" to "21.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 20.9 [default] to 21.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_typing.py /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/_musllinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: PV changed from "20.9" to "21.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 20.9 [default] to 21.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_typing.py /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/_musllinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "20.9" to "21.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 20.9 [default] to 21.0 [default]
packages/core2-32-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_typing.py /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/_musllinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PV changed from "20.9" to "21.0"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 193173 to 192658 (-0%)
packages/core2-32-poky-linux/python3-packaging/python3-packaging: PKGV changed from 20.9 [default] to 21.0 [default]
Changes to packages/core2-32-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/packaging/_manylinux.py was added
  /usr/lib/python3.9/site-packages/packaging/_musllinux.py was added
  /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/packaging/_compat.py was removed
  /usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/packaging/_typing.py was removed

--===============1009355936848042540==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-20.9-21.0.patch"

From 0a5f51fae0293eb182faee8c0cddef83b6fd4749 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 4 Jul 2021 07:39:28 +0000
Subject: [PATCH] python3-packaging: upgrade 20.9 -> 21.0

---
 .../{python3-packaging_20.9.bb => python3-packaging_21.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_20.9.bb => python3-packaging_21.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-packaging_20.9.bb b/meta/recipes-devtools/python/python3-packaging_21.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-packaging_20.9.bb
rename to meta/recipes-devtools/python/python3-packaging_21.0.bb
index 92cf6a25fe..23ecd9df5e 100644
--- a/meta/recipes-devtools/python/python3-packaging_20.9.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5"
+SRC_URI[sha256sum] = "7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7"
 
 inherit pypi setuptools3
 
-- 
2.20.1


--===============1009355936848042540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-packaging/python3-packaging-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/_typing.py", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_musllinux.py"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/_typing.py", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_musllinux.py"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/_typing.py", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_musllinux.py"
packages/core2-32-poky-linux/python3-packaging/python3-packaging-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/_typing.py", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_musllinux.py"
packages/core2-32-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info -> /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_compat.py /usr/lib/python3.9/site-packages/packaging/_typing.py", added "/usr/lib/python3.9/site-packages/packaging/_manylinux.py /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc /usr/lib/python3.9/site-packages/packaging/_musllinux.py"
Changes to packages/core2-32-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.9/site-packages/packaging-20.9-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/packaging-21.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/packaging/_manylinux.py was added
  /usr/lib/python3.9/site-packages/packaging/_musllinux.py was added
  /usr/lib/python3.9/site-packages/packaging/__pycache__/_manylinux.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/packaging/__pycache__/_musllinux.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/packaging/_compat.py was removed
  /usr/lib/python3.9/site-packages/packaging/__pycache__/_compat.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/packaging/__pycache__/_typing.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/packaging/_typing.py was removed

--===============1009355936848042540==--
