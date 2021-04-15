Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1331.1618510600196464745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 37CDE38C13E7
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 3.10.1 SUCCEEDED
Message-ID: <MADEUP.16761AD0F2A275CC.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150518
Content-Type: multipart/mixed; boundary="===============1170170699804055576=="

--===============1170170699804055576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *3.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-3.4.0-3.10.1.patch
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

--===============1170170699804055576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 54279 to 78398 (+44%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/top_level.txt was removed

--===============1170170699804055576==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-3.4.0-3.10.1.patch"

From e86f79ac6ec3ed449fc513f321f48df06d195953 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:23:44 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 3.4.0 -> 3.10.1

---
 ...b-metadata_3.4.0.bb => python3-importlib-metadata_3.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.4.0.bb => python3-importlib-metadata_3.10.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
index 81f24e55c2..af46a8ccc9 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "fa5daa4477a7414ae34e95942e4dd07f62adf589143c875c133c1e53c4eff38d"
+SRC_URI[sha256sum] = "c9356b657de65c53744046fa8f7358afe0714a1af7d570c00c3835c2d724a7c1"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.27.0


--===============1170170699804055576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "3.4.0" to "3.10.1"
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-3.4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-3.10.1.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 3.4.0 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "3.4.0" to "3.10.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 3.4.0 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "3.4.0" to "3.10.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 3.4.0 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "3.4.0" to "3.10.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 3.4.0 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "3.4.0" to "3.10.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 3.4.0 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "3.4.0" to "3.10.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 3.4.0 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "3.4.0" to "3.10.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 3.4.0 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "3.4.0" to "3.10.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 54279 to 78398 (+44%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 3.4.0 [default] to 3.10.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_collections.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_functools.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_itertools.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_collections.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_functools.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_itertools.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info/top_level.txt was removed

--===============1170170699804055576==--
