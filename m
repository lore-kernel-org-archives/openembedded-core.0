Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12420.1602843683161759980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8A11538C1793
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.19.2 SUCCEEDED
Message-ID: <MADEUP.163E71D69907D383.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143435
Content-Type: multipart/mixed; boundary="===============7471249506593935337=="

--===============7471249506593935337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.19.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.19.1-1.19.2.patch
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

--===============7471249506593935337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info
  /usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd was added

--===============7471249506593935337==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.19.1-1.19.2.patch"

From 436039d965e7581e8ebde95e548a06ba8617b6b9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 04:13:29 +0000
Subject: [PATCH] python3-numpy: upgrade 1.19.1 -> 1.19.2

---
 .../python-numpy/python-numpy.inc             |  4 +-
 .../python-numpy/python3-numpy_1.19.1.bb      |  3 --
 .../python-numpy/python3-numpy_1.19.2.bb      | 43 +++++++++++++++++++
 3 files changed, 45 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb
 create mode 100644 meta/recipes-devtools/python-numpy/python3-numpy_1.19.2.bb

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 0113f4098d..f91fb933dc 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -1,14 +1,14 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=643d4e90100b7abe468c4db88127b895"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e527e2a94c4584cd192d03ffb1f4a744"
 
 SRCNAME = "numpy"
 
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            "
-SRC_URI[sha256sum] = "1396e6c3d20cbfc119195303b0272e749610b7042cc498be4134f013e9a3215c"
+SRC_URI[sha256sum] = "74d0cf50aa28af81874aca3e67560945afd783b2a006913577d6cddc35a824a6"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb
deleted file mode 100644
index d388e88d25..0000000000
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-numpy.inc
-
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.2.bb
new file mode 100644
index 0000000000..d512eb5041
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.2.bb
@@ -0,0 +1,43 @@
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
+# @@ -35,22 +35,22 @@
+#  
+#  Name: Numpydoc
+#  Files: doc/sphinxext/numpydoc/*
+# -License: 2-clause BSD
+# +License: BSD-2-Clause
+#    For details, see doc/sphinxext/LICENSE.txt
+#  
+#  Name: scipy-sphinx-theme
+#  Files: doc/scipy-sphinx-theme/*
+# -License: 3-clause BSD, PSF and Apache 2.0
+# +License: BSD-3-Clause AND PSF-2.0 AND Apache-2.0
+#    For details, see doc/scipy-sphinx-theme/LICENSE.txt
+#  
+#  Name: lapack-lite
+#  Files: numpy/linalg/lapack_lite/*
+# -License: 3-clause BSD
+# +License: BSD-3-Clause
+#    For details, see numpy/linalg/lapack_lite/LICENSE.txt
+#  
+#  Name: tempita
+#  Files: tools/npy_tempita/*
+# -License: BSD derived
+# +License: MIT
+#    For details, see tools/npy_tempita/license.txt
+#  
+#  Name: dragon4
+# 
+#
+
+inherit setuptools3
+require python-numpy.inc
+
-- 
2.18.4


--===============7471249506593935337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PV changed from "1.19.1" to "1.19.2"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.19.1 [default] to 1.19.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 26773972 to 26761720 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.19.1" to "1.19.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.19.1 [default] to 1.19.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.19.1" to "1.19.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.19.1 [default] to 1.19.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.19.1" to "1.19.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.19.1 [default] to 1.19.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.19.1" to "1.19.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.19.1 [default] to 1.19.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 17537242 to 17178319 (-2%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.19.1" to "1.19.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.19.1 [default] to 1.19.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 254474 to 254470 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.19.1" to "1.19.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.19.1 [default] to 1.19.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 26446795 to 26471723 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.19.1" to "1.19.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.19.1 [default] to 1.19.2 [default]
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.8/site-packages/numpy-1.19.1-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/numpy-1.19.2-py3.8.egg-info
  /usr/lib/python3.8/site-packages/numpy/__init__.cython-30.pxd was added

--===============7471249506593935337==--
