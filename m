Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4464.1621074783442767245
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 311BA38C1382
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 4.0.1 SUCCEEDED
Message-ID: <MADEUP.167F36ED593FE1FC.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151789
Content-Type: multipart/mixed; boundary="===============3939374669322925815=="

--===============3939374669322925815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *4.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-3.10.1-4.0.1.patch
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

--===============3939374669322925815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 78398 to 89490 (+14%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_text.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/top_level.txt was removed

--===============3939374669322925815==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-3.10.1-4.0.1.patch"

From ae8e2a3dec1521166d3696157f867bad27bc0ad4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 05:03:08 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 3.10.1 -> 4.0.1

---
 ...b-metadata_3.10.1.bb => python3-importlib-metadata_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.10.1.bb => python3-importlib-metadata_4.0.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb
index af46a8ccc9..f4013da345 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "c9356b657de65c53744046fa8f7358afe0714a1af7d570c00c3835c2d724a7c1"
+SRC_URI[sha256sum] = "8c501196e49fb9df5df43833bdb1e4328f64847763ec8a50703148b73784d581"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.27.0


--===============3939374669322925815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "3.10.1" to "4.0.1"
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-3.10.1.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-4.0.1.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 3.10.1 [default] to 4.0.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "3.10.1" to "4.0.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 3.10.1 [default] to 4.0.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "3.10.1" to "4.0.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 3.10.1 [default] to 4.0.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "3.10.1" to "4.0.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 3.10.1 [default] to 4.0.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "3.10.1" to "4.0.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 3.10.1 [default] to 4.0.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "3.10.1" to "4.0.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 3.10.1 [default] to 4.0.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "3.10.1" to "4.0.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 3.10.1 [default] to 4.0.1 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "3.10.1" to "4.0.1"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 78398 to 89490 (+14%)
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/_text.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 3.10.1 [default] to 4.0.1 [default]
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata-4.0.1-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_adapters.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_meta.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_adapters.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_meta.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/__pycache__/_text.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/importlib_metadata/_text.py was added
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/importlib_metadata-3.10.1-py3.9.egg-info/top_level.txt was removed

--===============3939374669322925815==--
