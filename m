Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12418.1602843682982633104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A2F8338C17A2
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 50.3.1 SUCCEEDED
Message-ID: <MADEUP.163E71D6B43805B7.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143445
Content-Type: multipart/mixed; boundary="===============6189874980299938655=="

--===============6189874980299938655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *50.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-49.6.0-50.3.1.patch
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

--===============6189874980299938655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/py31compat.py", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpyt
 hon-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/py31compat.py", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpy
 thon-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/py31compat.py", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpy
 thon-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/py31compat.py", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.
 cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/py31compat.py", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38comp
 at.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/py31compat.py", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython
 -38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info
  /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pkg_resources/_vendor/__pycache__/six.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/pkg_resources/_vendor/six.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py27compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py31compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py33compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info
  /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pkg_resources/_vendor/__pycache__/six.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/pkg_resources/_vendor/six.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py27compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py31compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py33compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py was removed

--===============6189874980299938655==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-49.6.0-50.3.1.patch"

From 04d6302b4b76bb2159cab2182e0ee226433caa7f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 04:30:47 +0000
Subject: [PATCH] python3-setuptools: upgrade 49.6.0 -> 50.3.1

---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_49.6.0.bb => python3-setuptools_50.3.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_49.6.0.bb => python3-setuptools_50.3.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index ee0a9dbb13..cb37cef8b5 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 6a5086619ee1c4bcebc7df622face11de6679255 Mon Sep 17 00:00:00 2001
+From 73ff202b439faddd2d3089e7fbdecebc0d72ffe9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_49.6.0.bb b/meta/recipes-devtools/python/python3-setuptools_50.3.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_49.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_50.3.1.bb
index 360128b116..40361529b1 100644
--- a/meta/recipes-devtools/python/python3-setuptools_49.6.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_50.3.1.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "46bd862894ed22c2edff033c758c2dc026324788d758e96788e8f7c11f4e9707"
+SRC_URI[sha256sum] = "0e9772768fa6e9d3cf818a3e6e24dd2236f319d2c478312995edcb30ddeb8343"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.18.4


--===============6189874980299938655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py31compat.py /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpyt
 hon-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 914436 to 858613 (-6%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py31compat.py /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpy
 thon-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py31compat.py /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpy
 thon-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py31compat.py /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpy
 thon-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py31compat.py /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.
 cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py31compat.py /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpy
 thon-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py31compat.py /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35comp
 at.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "49.6.0" to "50.3.1"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info -> /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info, removed "/usr/lib/python3.8/site-packages/setuptools/py33compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/py31compat.py /usr/lib/python3.8/site-packages/setuptools/py27compat.py /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc", added "/usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython
 -38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 49.6.0 [default] to 50.3.1 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 3102837 to 3034807 (-2%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info
  /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pkg_resources/_vendor/__pycache__/six.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/pkg_resources/_vendor/six.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py27compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py31compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py33compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.8/site-packages/setuptools-49.6.0-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/setuptools-50.3.1-py3.8.egg-info
  /usr/lib/python3.8/site-packages/setuptools/_distutils/command/py37compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/command/__pycache__/py37compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/py35compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/py38compat.py was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py35compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/setuptools/_distutils/__pycache__/py38compat.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pkg_resources/_vendor/__pycache__/six.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/pkg_resources/_vendor/six.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py27compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py31compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/py33compat.py was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py27compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py31compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/__pycache__/py33compat.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/_vendor/__pycache__/six.cpython-38.pyc was removed
  /usr/lib/python3.8/site-packages/setuptools/_vendor/six.py was removed

--===============6189874980299938655==--
