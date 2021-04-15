Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.1363.1618510600238628654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4D88B38C13FB
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 56.0.0 SUCCEEDED
Message-ID: <MADEUP.16761AD0FE23B4B7.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150523
Content-Type: multipart/mixed; boundary="===============2386451959788320580=="

--===============2386451959788320580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *56.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-54.1.1-56.0.0.patch
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

--===============2386451959788320580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py was removed
  /usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py was removed
  /usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc was removed

--===============2386451959788320580==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-54.1.1-56.0.0.patch"

From 749b84c9de62ee7fb9b32ecd5cb4060b0c56c9d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:36:53 +0000
Subject: [PATCH] python3-setuptools: upgrade 54.1.1 -> 56.0.0

---
 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
 ...hon3-setuptools_54.1.1.bb => python3-setuptools_56.0.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_54.1.1.bb => python3-setuptools_56.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 680edbe704..5dd55f19a2 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 6380cc63f79abe8b8404c9be5ed5f213a70c8c6a Mon Sep 17 00:00:00 2001
+From 552758405739be9ae220bbd158c2a1b7176fe292 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index eeb21b5..eca1edd 100644
+index 0917804..eed4a5a 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -636,6 +636,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
index 74264a3814..07a82ad21b 100644
--- a/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_56.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "1ce82798848a978696465866bb3aaab356003c42d6143e1111fcf069ac838274"
+SRC_URI[sha256sum] = "08a1c0f99455307c48690f00d5c2ac2c1ccfab04df00454fef854ec145b81302"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.27.0


--===============2386451959788320580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-54.1.1.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-56.0.0.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-setuptools: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 859239 to 859576 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "54.1.1" to "56.0.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 3028858 to 3029204 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 54.1.1 [default] to 56.0.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info, removed "/usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py was removed
  /usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc was removed
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools-54.1.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools-56.0.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/setuptools/command/bdist_wininst.py was removed
  /usr/lib/python3.9/site-packages/setuptools/command/__pycache__/bdist_wininst.cpython-39.pyc was removed

--===============2386451959788320580==--
