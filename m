Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.16338.1623585061783390253
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 55C0138C13F8
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.14.0 SUCCEEDED
Message-ID: <MADEUP.16882202FDBEB951.6241@lists.openembedded.org>
X-Groupsio-MsgNum: 152899
Content-Type: multipart/mixed; boundary="===============3616699470237880100=="

--===============3616699470237880100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.13.14-6.14.0.patch
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

--===============3616699470237880100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.13.14" to "6.14.0"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.13.14.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.14.0.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.13.14 [default] to 6.14.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.13.14" to "6.14.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.13.14 [default] to 6.14.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.13.14" to "6.14.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.13.14 [default] to 6.14.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.13.14" to "6.14.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.13.14 [default] to 6.14.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.13.14" to "6.14.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.13.14 [default] to 6.14.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.13.14" to "6.14.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.13.14 [default] to 6.14.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.13.14" to "6.14.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.13.14 [default] to 6.14.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1883146 to 1883837 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.13.14" to "6.14.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.13.14 [default] to 6.14.0 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/entry_points.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/not-zip-safe was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/entry_points.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/not-zip-safe was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/top_level.txt was removed

--===============3616699470237880100==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.13.14-6.14.0.patch"

From 1a3234943b4f6f4f28c0ef5a3ac3d365f0ad91b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 09:48:37 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.13.14 -> 6.14.0

---
 ...thon3-hypothesis_6.13.14.bb => python3-hypothesis_6.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.13.14.bb => python3-hypothesis_6.14.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb b/meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
index 150dc8a5d6..16afd699e6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "36ef2d58f600be2973f694f45a55a5502de705d7594f9cf841276aec9082c414"
+SRC_URI[sha256sum] = "9bdee01ae260329b16117e9b0229a839b4a77747a985922653f595bd2a6a541a"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers python3-unittest"
 
-- 
2.17.1


--===============3616699470237880100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/entry_points.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/not-zip-safe was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.14.0-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/entry_points.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/not-zip-safe was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/top_level.txt was removed

--===============3616699470237880100==--
