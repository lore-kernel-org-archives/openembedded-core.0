Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1330.1618510599872298479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4701538C13F6
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 6.0.1 SUCCEEDED
Message-ID: <MADEUP.16761AD10F7F4C42.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150532
Content-Type: multipart/mixed; boundary="===============3519963261272764855=="

--===============3519963261272764855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-scm* to *6.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-5.0.1-6.0.1.patch
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

--===============3519963261272764855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py was removed
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py was removed

--===============3519963261272764855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-5.0.1-6.0.1.patch"

From b76dcacac3976dc783d025cdff68abd7661ebf49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:32:26 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 5.0.1 -> 6.0.1

---
 ...-setuptools-scm_5.0.1.bb => python3-setuptools-scm_6.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_5.0.1.bb => python3-setuptools-scm_6.0.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
index ead80da7b4..24409eddc5 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.0.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "c85b6b46d0edd40d2301038cdea96bb6adc14d62ef943e75afb08b3e7bcf142a"
+SRC_URI[sha256sum] = "d1925a69cb07e9b29416a275b9fadb009a23c148ace905b2fb220649a6c18e92"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
-- 
2.27.0


--===============3519963261272764855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-scm: PKGV changed from 5.0.1 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm: PV changed from "5.0.1" to "6.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-5.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-6.0.1.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 5.0.1 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "5.0.1" to "6.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 5.0.1 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "5.0.1" to "6.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 5.0.1 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "5.0.1" to "6.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 5.0.1 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "5.0.1" to "6.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 5.0.1 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "5.0.1" to "6.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 5.0.1 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "5.0.1" to "6.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 121854 to 117370 (-4%)
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 5.0.1 [default] to 6.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "5.0.1" to "6.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py was removed
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-6.0.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools_scm/__pycache__/win_py31_compat.cpython-39.pyc was removed
  /usr/lib/python3.9/site-packages/setuptools_scm/win_py31_compat.py was removed

--===============3519963261272764855==--
