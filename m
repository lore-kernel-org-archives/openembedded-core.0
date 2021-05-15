Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4569.1621074783776311507
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 141EC38C1370
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 21.2.0 SUCCEEDED
Message-ID: <MADEUP.167F36ED58E2C70D.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151796
Content-Type: multipart/mixed; boundary="===============0684385684042343855=="

--===============0684385684042343855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-attrs* to *21.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-20.3.0-21.2.0.patch
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

--===============0684385684042343855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-20.3.0-21.2.0.patch"

From 6d0d9dc453b84600dd9352974b8ee3a98058d25e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 04:51:16 +0000
Subject: [PATCH] python3-attrs: upgrade 20.3.0 -> 21.2.0

---
 .../{python3-attrs_20.3.0.bb => python3-attrs_21.2.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-attrs_20.3.0.bb => python3-attrs_21.2.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-attrs_20.3.0.bb b/meta/recipes-devtools/python/python3-attrs_21.2.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-attrs_20.3.0.bb
rename to meta/recipes-devtools/python/python3-attrs_21.2.0.bb
index 55cfda7180..e89fbc96f2 100644
--- a/meta/recipes-devtools/python/python3-attrs_20.3.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_21.2.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
-SRC_URI[md5sum] = "4fe38f89297b2b446d83190fce189f29"
+SRC_URI[sha256sum] = "ef6aaac3ca6cd92904cdd0d83f629a15f18053ec84e6432106f7a4d04ae4f5fb"
 
 inherit pypi setuptools3
 
-- 
2.27.0


--===============0684385684042343855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-attrs/python3-attrs-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/_cmp.py /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/_cmp.py /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/_cmp.py /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/_cmp.py /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc"
packages/core2-32-poky-linux/python3-attrs/python3-attrs: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/_cmp.py /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/attr/_cmp.py was added
  /usr/lib/python3.9/site-packages/attr/_cmp.pyi was added
  /usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc was added

--===============0684385684042343855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-attrs: PV changed from "20.3.0" to "21.2.0"
packages/core2-32-poky-linux/python3-attrs: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/attrs/attrs-20.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/a/attrs/attrs-21.2.0.tar.gz"
packages/core2-32-poky-linux/python3-attrs: PKGV changed from 20.3.0 [default] to 21.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dbg: PV changed from "20.3.0" to "21.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dbg: PKGV changed from 20.3.0 [default] to 21.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/_cmp.py"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dev: PV changed from "20.3.0" to "21.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dev: PKGV changed from 20.3.0 [default] to 21.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/_cmp.py"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-doc: PV changed from "20.3.0" to "21.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-doc: PKGV changed from 20.3.0 [default] to 21.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/_cmp.py"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-locale: PV changed from "20.3.0" to "21.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-locale: PKGV changed from 20.3.0 [default] to 21.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/_cmp.py"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-src: PV changed from "20.3.0" to "21.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-src: PKGV changed from 20.3.0 [default] to 21.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/_cmp.py"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-staticdev: PV changed from "20.3.0" to "21.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs-staticdev: PKGV changed from 20.3.0 [default] to 21.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/_cmp.py"
packages/core2-32-poky-linux/python3-attrs/python3-attrs: PV changed from "20.3.0" to "21.2.0"
packages/core2-32-poky-linux/python3-attrs/python3-attrs: PKGV changed from 20.3.0 [default] to 21.2.0 [default]
packages/core2-32-poky-linux/python3-attrs/python3-attrs: FILELIST: directory renamed /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc /usr/lib/python3.9/site-packages/attr/_cmp.pyi /usr/lib/python3.9/site-packages/attr/_cmp.py"
packages/core2-32-poky-linux/python3-attrs/python3-attrs: PKGSIZE changed from 275240 to 301661 (+10%)
Changes to packages/core2-32-poky-linux/python3-attrs (sysroot):
  /usr/lib/python3.9/site-packages/attrs-20.3.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/attrs-21.2.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/attr/_cmp.py was added
  /usr/lib/python3.9/site-packages/attr/_cmp.pyi was added
  /usr/lib/python3.9/site-packages/attr/__pycache__/_cmp.cpython-39.pyc was added

--===============0684385684042343855==--
