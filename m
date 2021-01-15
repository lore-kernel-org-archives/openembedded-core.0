Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.721.1610713822642426781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 29E6F38C12E1
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 3.4.0 SUCCEEDED
Message-ID: <MADEUP.165A67B02A1EF9E4.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146762
Content-Type: multipart/mixed; boundary="===============2440717805306797176=="

--===============2440717805306797176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *3.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-3.3.0-3.4.0.patch
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

--===============2440717805306797176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/importlib_metadata/py.typed was added

--===============2440717805306797176==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-3.3.0-3.4.0.patch"

From 183579f21caab486f8bb52ae5b1b323cf673955b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 05:50:16 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 3.3.0 -> 3.4.0

---
 ...ib-metadata_3.3.0.bb => python3-importlib-metadata_3.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.3.0.bb => python3-importlib-metadata_3.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
index 23f2e2dbaf..4e2d23721c 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "5c5a2720817414a6c41f0a49993908068243ae02c1635a228126519b509c8aed"
+SRC_URI[sha256sum] = "fa5daa4477a7414ae34e95942e4dd07f62adf589143c875c133c1e53c4eff38d"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.27.0


--===============2440717805306797176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-importlib-metadata: PKGV changed from 3.3.0 [default] to 3.4.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-3.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-3.4.0.tar.gz"
packages/core2-32-poky-linux/python3-importlib-metadata: PV changed from "3.3.0" to "3.4.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 3.3.0 [default] to 3.4.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "3.3.0" to "3.4.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 3.3.0 [default] to 3.4.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "3.3.0" to "3.4.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 3.3.0 [default] to 3.4.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "3.3.0" to "3.4.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 3.3.0 [default] to 3.4.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "3.3.0" to "3.4.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 3.3.0 [default] to 3.4.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "3.3.0" to "3.4.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 3.3.0 [default] to 3.4.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "3.3.0" to "3.4.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 3.3.0 [default] to 3.4.0 [default]
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/importlib_metadata/py.typed"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "3.3.0" to "3.4.0"
packages/core2-32-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 54096 to 54279 (+0%)
Changes to packages/core2-32-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.9/site-packages/importlib_metadata-3.3.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/importlib_metadata-3.4.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/importlib_metadata/py.typed was added

--===============2440717805306797176==--
