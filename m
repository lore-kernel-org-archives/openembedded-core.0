Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.5211.1613463848578057905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 33A1F38C123F
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:09 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.20.1 SUCCEEDED
Message-ID: <MADEUP.16642CD2914E0C2F.16989@lists.openembedded.org>
X-Groupsio-MsgNum: 148111
Content-Type: multipart/mixed; boundary="===============5181910973371155623=="

--===============5181910973371155623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.20.0-1.20.1.patch
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

--===============5181910973371155623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py was added
  /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py was added

--===============5181910973371155623==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.20.0-1.20.1.patch"

From 97dc30a156f903c31efdfe74f1643e980226b6e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 21:27:29 +0000
Subject: [PATCH] python3-numpy: upgrade 1.20.0 -> 1.20.1

---
 ...umpy_1.20.0.bb => python3-numpy_1.20.1.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.20.0.bb => python3-numpy_1.20.1.bb} (71%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
similarity index 71%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
index 8d348d85ca..282930baae 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.0.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
@@ -1,7 +1,26 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2005-2020, NumPy Developers.
+# +Copyright (c) 2005-2021, NumPy Developers.
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=474c7e8e97b80fb7500de2b0c4a4a8d4"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=aa1ecaef18152f75bfae546b29c49d3c"
 
 SRCNAME = "numpy"
 
@@ -10,7 +29,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "67b630745a71b541ff6517d6f3d62b00690dc8ba0684cad0d7b0ac55aec1de53"
+SRC_URI[sha256sum] = "9bf51d69ebb4ca9239e55bedc2185fe2c0ec222da0adee7ece4125414676846d"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.1


--===============5181910973371155623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.20.0/numpy-1.20.0.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.20.1/numpy-1.20.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 30959528 to 30959468 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 17792899 to 17792681 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 259270 to 259274 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 28686908 to 28700632 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.20.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/numpy/distutils/tests/__pycache__/test_build_ext.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/numpy/distutils/tests/test_build_ext.py was added
  /usr/lib/python3.9/site-packages/numpy/typing/tests/data/pass/modules.py was added

--===============5181910973371155623==--
