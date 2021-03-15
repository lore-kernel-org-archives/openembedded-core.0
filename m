Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.328.1615826521152834421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id E10C638C12A1
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.8.1 SUCCEEDED
Message-ID: <MADEUP.166C91A8FF77346D.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149488
Content-Type: multipart/mixed; boundary="===============6250558839857778826=="

--===============6250558839857778826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.2.0-6.8.1.patch
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

--===============6250558839857778826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.8.1.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.2.0 [default] to 6.8.1 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.2.0" to "6.8.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.2.0 [default] to 6.8.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.2.0" to "6.8.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.2.0 [default] to 6.8.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.2.0" to "6.8.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.2.0 [default] to 6.8.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.2.0" to "6.8.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.2.0 [default] to 6.8.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.2.0" to "6.8.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.2.0 [default] to 6.8.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.2.0" to "6.8.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.2.0 [default] to 6.8.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.2.0" to "6.8.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.2.0 [default] to 6.8.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1817876 to 1851923 (+2%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.2.0" to "6.8.1"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py was added
  /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py was added

--===============6250558839857778826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info -> /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.2.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/hypothesis-6.8.1-py3.9.egg-info
  /usr/lib/python3.9/site-packages/hypothesis/internal/filtering.py was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/filtering.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/__pycache__/scrutineer.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/internal/scrutineer.py was added
  /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/__pycache__/utils.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/hypothesis/strategies/_internal/utils.py was added

--===============6250558839857778826==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.2.0-6.8.1.patch"

From d7aaa3bf0fcc07d02f6c0a27112c490660137865 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 06:15:27 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.2.0 -> 6.8.1

---
 ...{python3-hypothesis_6.2.0.bb => python3-hypothesis_6.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.2.0.bb => python3-hypothesis_6.8.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.8.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.8.1.bb
index be9418386f..fee508dcc6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.8.1.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c16fbde26b65c98a2464c48209b066c2f6dab5e8e38acd9d959021eb8d58b6c0"
+SRC_URI[sha256sum] = "2dd38676402d1c218225210cde0cf19f286352279f32631ac5c801f5d767bc94"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.17.1


--===============6250558839857778826==--
