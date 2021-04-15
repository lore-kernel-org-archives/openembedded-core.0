Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1329.1618510599840320599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 35D3F38C13E4
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.9.1 SUCCEEDED
Message-ID: <MADEUP.16761AD0EF63D773.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150517
Content-Type: multipart/mixed; boundary="===============4245647901547165557=="

--===============4245647901547165557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.2.0-6.9.1.patch
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

--===============4245647901547165557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py was added
  /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py was added

--===============4245647901547165557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.2.0-6.9.1.patch"

From c1c396e85f7a39b663f33c2eec3b675d5c542be6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:21:02 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.2.0 -> 6.9.1

---
 ...{python3-hypothesis_6.2.0.bb => python3-hypothesis_6.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.2.0.bb => python3-hypothesis_6.9.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb
index be9418386f..4532998bdc 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c16fbde26b65c98a2464c48209b066c2f6dab5e8e38acd9d959021eb8d58b6c0"
+SRC_URI[sha256sum] = "5e25a0be23b1ff81ecf07e87d82e2e39a79c83c1458178af202ffe4b0183bcca"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.27.0


--===============4245647901547165557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.9.1.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.2.0 [default] to 6.9.1 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.2.0" to "6.9.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.2.0 [default] to 6.9.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.2.0" to "6.9.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.2.0 [default] to 6.9.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.2.0" to "6.9.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.2.0 [default] to 6.9.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.2.0" to "6.9.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.2.0 [default] to 6.9.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.2.0" to "6.9.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.2.0 [default] to 6.9.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.2.0" to "6.9.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.2.0 [default] to 6.9.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.2.0" to "6.9.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.2.0 [default] to 6.9.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1817876 to 1858347 (+2%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.2.0" to "6.9.1"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.9.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py was added
  /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py was added

--===============4245647901547165557==--
