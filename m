Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.4492.1621074783473336637
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 40E6C38C12A7
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markupsafe: upgrading to 2.0.0 SUCCEEDED
Message-ID: <MADEUP.167F36ED6542F30D.8589@lists.openembedded.org>
X-Groupsio-MsgNum: 151803
Content-Type: multipart/mixed; boundary="===============5379446391628193207=="

--===============5379446391628193207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markupsafe* to *2.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markupsafe-upgrade-1.1.1-2.0.0.patch
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

--===============5379446391628193207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi /usr/lib/python3.9/site-packages/markupsafe/py.typed"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi /usr/lib/python3.9/site-packages/markupsafe/py.typed"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi /usr/lib/python3.9/site-packages/markupsafe/py.typed"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi /usr/lib/python3.9/site-packages/markupsafe/py.typed"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGSIZE changed from 9884 to 7400 (-25%)
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi /usr/lib/python3.9/site-packages/markupsafe/py.typed"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PKGSIZE changed from 63713 to 49623 (-22%)
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi /usr/lib/python3.9/site-packages/markupsafe/py.typed"
Changes to packages/core2-32-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/markupsafe/py.typed was added
  /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi was added
  /usr/lib/python3.9/site-packages/markupsafe/_compat.py was removed
  /usr/lib/python3.9/site-packages/markupsafe/_constants.py was removed
  /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc was removed

--===============5379446391628193207==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-markupsafe-upgrade-1.1.1-2.0.0.patch"

From 148bb6fbc36b8e9d953e3fcce2609a1208d6100e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 05:08:40 +0000
Subject: [PATCH] python3-markupsafe: upgrade 1.1.1 -> 2.0.0

---
 ...python3-markupsafe_1.1.1.bb => python3-markupsafe_2.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_1.1.1.bb => python3-markupsafe_2.0.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb b/meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb
index cade4e0f51..5e4be22ee3 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "43fd756864fe42063068e092e220c57b"
-SRC_URI[sha256sum] = "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
+SRC_URI[sha256sum] = "4fae0677f712ee090721d8b17f412f1cbceefbf0dc180fe91bab3232f38b4527"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3
-- 
2.27.0


--===============5379446391628193207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-markupsafe: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-1.1.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-2.0.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/py.typed /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGSIZE changed from 24804 to 25464 (+3%)
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dev: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dev: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/py.typed /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-doc: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-doc: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/py.typed /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-locale: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-locale: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/py.typed /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/py.typed /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGSIZE changed from 8113 to 7916 (-2%)
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/py.typed /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGSIZE changed from 9884 to 7400 (-25%)
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/py.typed /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PKGV changed from 1.1.1 [default] to 2.0.0 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PV changed from "1.1.1" to "2.0.0"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: FILELIST: directory renamed /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc /usr/lib/python3.9/site-packages/markupsafe/_constants.py /usr/lib/python3.9/site-packages/markupsafe/_compat.py /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc", added "/usr/lib/python3.9/site-packages/markupsafe/py.typed /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PKGSIZE changed from 63713 to 49623 (-22%)
Changes to packages/core2-32-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.9/site-packages/MarkupSafe-1.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/MarkupSafe-2.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/markupsafe/py.typed was added
  /usr/lib/python3.9/site-packages/markupsafe/_speedups.pyi was added
  /usr/lib/python3.9/site-packages/markupsafe/_compat.py was removed
  /usr/lib/python3.9/site-packages/markupsafe/_constants.py was removed
  /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_compat.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/markupsafe/__pycache__/_constants.cpython-39.pyc was removed

--===============5379446391628193207==--
