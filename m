Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.6893.1622200976351755206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5F83738C1377
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 57.0.0 FAILED
Message-ID: <MADEUP.1683373180941C8B.3006@lists.openembedded.org>
X-Groupsio-MsgNum: 152353
Content-Type: multipart/mixed; boundary="===============0509776961647429642=="

--===============0509776961647429642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *57.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-56.2.0-57.0.0.patch
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

--===============0509776961647429642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6363477 to 6363466 (-0%)
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-56.2.0.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-57.0.0.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-setuptools: PV changed from "56.2.0" to "57.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 859576 to 859578 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "56.2.0" to "57.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "56.2.0" to "57.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "56.2.0" to "57.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "56.2.0" to "57.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "56.2.0" to "57.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "56.2.0" to "57.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "56.2.0" to "57.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 3031635 to 3292263 (+9%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 56.2.0 [default] to 57.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "56.2.0" to "57.0.0"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__ was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__ was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py was added

--===============0509776961647429642==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-56.2.0-57.0.0.patch"

From a4fa74285f7e02d58ece1dc44f1719f7636a7d32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 08:39:23 +0000
Subject: [PATCH] python3-setuptools: upgrade 56.2.0 -> 57.0.0

---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_56.2.0.bb => python3-setuptools_57.0.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_56.2.0.bb => python3-setuptools_57.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 59e278d1ae..1082fe79be 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From d6339e6b3de0f3be5ca50541d82f99d827700f45 Mon Sep 17 00:00:00 2001
+From f6afc18e08a6c428ce8becd114c535a6840f1b9f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
index bb852d0652..e75d9fbdd5 100644
--- a/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "7bb5652625e94e73b9358b7ed8c6431b732e80cf31f4e0972294c64f0e5b849e"
+SRC_URI[sha256sum] = "401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.27.0


--===============0509776961647429642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__ was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-56.2.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-57.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__init__.py was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/more.py was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__ was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/__init__.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/more.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/__pycache__/recipes.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/setuptools/_vendor/more_itertools/recipes.py was added

--===============0509776961647429642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1458 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (821 cached, 1 parsed). 1456 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-004965c3c5167d575e4674548681acbad3b00f67"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:004965c3c5167d575e4674548681acbad3b00f67"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 93 Local 1 Network 0 Missed 92 Current 649 (1% match, 87% complete)
Removing 60 stale sstate objects for arch core2-64...done.
Removing 25 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 906 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 927 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1076 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2021.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2021.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1236 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_configure)
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1286 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure)
NOTE: recipe xorgproto-2021.4-r0: task do_configure: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure: Started
NOTE: Running task 1619 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_fetch)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1973 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_unpack)
NOTE: Running task 1974 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2140 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2141 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2142 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2143 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2144 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 62f6431f19fede238466e190955b5b9d556d5896ebde028532bf0150e9f43d12
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2021.4-r0: task do_configure: Succeeded
NOTE: Running task 2145 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_compile)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_populate_lic: Started
NOTE: recipe xorgproto-2021.4-r0: task do_compile: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_populate_lic unihash changed to f0064d3616334b2eed6b482de3fa6066a844fb3e5b4b4f0c6f2912a65b8e2ba4
NOTE: Running task 2146 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_configure)
NOTE: recipe xorgproto-2021.4-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2147 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_install)
NOTE: Running task 2148 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2149 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_compile)
NOTE: recipe xorgproto-2021.4-r0: task do_install: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4536779b7dca0a5c3d8e03313918f0c89e1a8005eaa6177b0bfb304d882f478c
NOTE: Setscene tasks completed
NOTE: Running task 2150 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2152 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_install)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_configure: Succeeded
NOTE: Running task 2153 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile)
NOTE: Running task 2155 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_populate_sysroot)
NOTE: Running task 2156 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_package)
NOTE: recipe xorgproto-2021.4-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.4-r0: task do_package: Started
NOTE: recipe xorgproto-2021.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_populate_sysroot unihash changed to e978c48ad33861468426d0fc42f7477749f0583625f7ec77eee52f514cd44a80
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Running setscene task 781 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2157 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile_ptest_base)
NOTE: recipe xorgproto-2021.4-r0: task do_package: Succeeded
NOTE: Running task 2158 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 816 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata: Started
NOTE: Running task 2169 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Succeeded
NOTE: Running task 2170 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package)
NOTE: recipe wayland-1.19.0-r0: task do_install: Started
NOTE: Running task 2171 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_populate_sysroot)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_packagedata unihash changed to f6355f4b93430a3adaafad6b2acc9ae4d02899773b9606c3b8b7d9bca6d29e92
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm became valid
NOTE: Running setscene task 846 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 847 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_setscene)
NOTE: Running setscene task 848 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 849 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_setscene)
NOTE: Running setscene task 850 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 851 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_setscene)
NOTE: Running setscene task 852 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 853 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_setscene)
NOTE: Running setscene task 854 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 855 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 856 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running task 2192 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 873 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 874 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_install: Succeeded
NOTE: Running task 2193 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install_ptest_base)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2197 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot)
NOTE: Running task 2198 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_package_write_rpm unihash changed to f9415fd303786e2837001b81a935682dfb89c380d51cbf323bb38e13019ec8f2
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 876 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot unihash changed to 9c3d2c6df9a6e2410febddd46d0a93396c239c5d4292cb034b4a311b43e30039
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Succeeded
NOTE: Running task 2199 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Succeeded
NOTE: Running task 2201 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 928 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2208 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_configure)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2209 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package_write_rpm)
NOTE: Running task 2210 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package_qa)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_qa: Succeeded
ERROR: libxcb-1.14-r0 do_packagedata_setscene: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:buildhistory_emit_pkghistory(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass', lineno: 322, function: buildhistory_emit_pkghistory
     0318:
     0319:        write_pkghistory(pkginfo, d)
     0320:
     0321:    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
 *** 0322:    bb.build.exec_func("buildhistory_list_pkg_files", d)
     0323:}
     0324:
     0325:python buildhistory_emit_outputsigs() {
     0326:    if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/build.py', lineno: 256, function: exec_func
     0252:    with bb.utils.fileslocked(lockfiles):
     0253:        if ispython:
     0254:            exec_func_python(func, d, runfile, cwd=adir)
     0255:        else:
 *** 0256:            exec_func_shell(func, d, runfile, cwd=adir)
     0257:
     0258:    try:
     0259:        curcwd = os.getcwd()
     0260:    except:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/build.py', lineno: 503, function: exec_func_shell
     0499:    with open(fifopath, 'r+b', buffering=0) as fifo:
     0500:        try:
     0501:            bb.debug(2, "Executing shell function %s" % func)
     0502:            with open(os.devnull, 'r+') as stdin, logfile:
 *** 0503:                bb.process.run(cmd, shell=False, stdin=stdin, log=logfile, extrafiles=[(fifo,readfifo)])
     0504:        except bb.process.ExecutionError as exe:
     0505:            # Find the backtrace that the shell trap generated
     0506:            backtrace_marker_regex = re.compile(r"WARNING: Backtrace \(BB generated script\)")
     0507:            stdout_lines = (exe.stdout or "").split("\n")
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/process.py', lineno: 184, function: run
     0180:        if not stderr is None:
     0181:            stderr = stderr.decode("utf-8")
     0182:
     0183:    if pipe.returncode != 0:
 *** 0184:        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
     0185:    return stdout, stderr
Exception: bb.process.ExecutionError: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.3121127' failed with exit code 1:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.3121127: line 173: cd: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcb/1.14-r0/packages-split/libxcb-glx: No such file or directory
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.3121127:170 exit 1 from 'buildhistory_list_files $pkgdir $outfile fakeroot'
WARNING: Backtrace (BB generated script): 
	#1: buildhistory_list_files, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.3121127, line 170
	#2: buildhistory_list_pkg_files, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.3121127, line 165
	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.3121127, line 214

Backtrace (metadata-relative locations):
	#1: buildhistory_list_files, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass, line 548
	#2: buildhistory_list_pkg_files, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass, line 585

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxcb/1.14-r0/temp/log.do_packagedata_setscene.3121127
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Failed
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 929 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2211 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 2214 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 11e99fe52a5d98c38b750a7b0a7984b7b13f70b737e7130c1f59cfe8e5fcc524
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2216 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_compile)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2223 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot unihash changed to a47f4ec2e806048080f788a3a5764e0d738b37abde0d9e7db1cd4fd65aa18fd6
NOTE: Setscene tasks completed
NOTE: Running task 2224 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2225 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_configure)
NOTE: recipe systemd-1_248.3-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2226 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata unihash changed to eb2b33b987093581eb46cf2e9641c3a4cc908812910c4f9416fee1eb8cc11b9e
NOTE: Setscene tasks completed
NOTE: Running task 2227 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm unihash changed to 0b6fd758964d19fc61e3b237be10ed92b4c54fb286f4a0fb0890c2b66e556f07
NOTE: recipe systemd-1_248.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2228 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_compile)
NOTE: recipe systemd-1_248.3-r0: task do_compile: Started
NOTE: recipe systemd-1_248.3-r0: task do_compile: Succeeded
NOTE: Running task 2229 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_install)
NOTE: recipe systemd-1_248.3-r0: task do_install: Started
NOTE: recipe systemd-1_248.3-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot)
NOTE: Running task 2231 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package)
NOTE: recipe systemd-1_248.3-r0: task do_package: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot unihash changed to dc7b8a5482a8a39980728c04a39f603a28e69fbaa557f65721d7fbecdb06fb88
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1101 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running task 2236 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2242 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2243 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2244 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2245 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2246 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe systemd-1_248.3-r0: task do_package: Succeeded
NOTE: Running task 2247 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata unihash changed to 4b7a147aa5de64e9253d6eb45d8b6f5b148067db4970c891c9560726df17d9d1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1105 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_setscene)
NOTE: Running setscene task 1110 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1112 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 1124 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1125 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1126 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running task 2248 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2256 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2257 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2258 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: Running task 2259 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2260 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2261 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_compile: Succeeded
NOTE: Running task 2262 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2263 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_install: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm unihash changed to 0c7ac0cbb25de7159d9391d2867365be9420e357cb9408adc8b2124083ce3f1d
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_install: Succeeded
NOTE: Running task 2264 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2265 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 5d7be74e4fa0bc06348a715cf613081b19ae59c7d76939958b77ea772bf14c51
NOTE: Running task 2266 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot unihash changed to cdf2e2f09d47bc84f5d24c0bbcaa0e1597ccfe56244fb06a477e9dce9dd922db
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1145 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1153 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: Running task 2273 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2301 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2304 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: Running task 2305 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: Running task 2306 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to d530a3b96e8dd2fe5206ae9fb0bdbbdc00ae3bacfa7255e85f171307b302a41e
NOTE: Setscene tasks completed
NOTE: Running task 2309 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: Running task 2310 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata unihash changed to 8fbf48ad46e23fe2ad3de569d365776ece5f99b52f3efdda7b744da6a79df7ba
NOTE: Setscene tasks completed
NOTE: Running task 2311 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package)
NOTE: Running task 2312 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to fe05e8e7359ef6647892c38c2d167254d71841693157e188c6e045cdf5550c1e
NOTE: recipe gettext-0.21-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2313 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm unihash changed to df5224fe7116e56fe732bfbbbf9a082abf680b72ace746850abd56df5aace6b7
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2314 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to a25950112138fd7a578c464888a72e5690195ce8cbc58150e98f86b688f0d8e8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1181 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running task 2315 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2317 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to c44144c95310bde4dfdc7d24a1d88949155259313310608351b9e35dd232a14c
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to 6b35a831625443a382f12bfbe88d1ff82209b8c504753083cbde218a7e3ce6c1
NOTE: Setscene tasks completed
NOTE: Running task 2318 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2319 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm unihash changed to adcedc882734e92233b34f5cc208e23c89a7dc2c5db3550a4ee2be0550762d78
NOTE: recipe gettext-0.21-r0: task do_package: Succeeded
NOTE: Running task 2320 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata)
NOTE: recipe gettext-0.21-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata unihash changed to 1b5ab52739cb3839323a225a28902676dee317464071900956f2067583b0fcb7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata became valid
NOTE: Running setscene task 1184 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1185 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_setscene)
NOTE: Running setscene task 1186 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running task 2321 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm unihash changed to bf99506d50d7054d782fcddce86af929033552ffc071d011607ae8ca86f97e63
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.6-r0: task do_package_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1188 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1190 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2328 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm unihash changed to f4c890cfd82b5a6f0f4813493d99a0904caf149db9ab29d9c901efccb357746a
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm unihash changed to 7e4970751890b31c3b1aa3d8ec6d0b0708d3da6dc350b5a6aaee5473287d3523
NOTE: Running noexec task 2329 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2329 tasks of which 2235 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============0509776961647429642==--
