Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.26025.1623000257692446751
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 07E0238C1265
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.13.14 SUCCEEDED
Message-ID: <MADEUP.16860E22AD4413D9.27789@lists.openembedded.org>
X-Groupsio-MsgNum: 152707
Content-Type: multipart/mixed; boundary="===============6044108275247419651=="

--===============6044108275247419651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.13.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.13.7-6.13.14.patch
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

--===============6044108275247419651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/entry_points.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/not-zip-safe was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/entry_points.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/not-zip-safe was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/top_level.txt was removed

--===============6044108275247419651==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.13.7-6.13.14.patch"

From fe59859b979eabd24d53c4c683f1575f67695333 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 09:02:39 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.13.7 -> 6.13.14

---
 ...thon3-hypothesis_6.13.7.bb => python3-hypothesis_6.13.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.13.7.bb => python3-hypothesis_6.13.14.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
index 7688ff6d18..66e35811cb 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "262bb8cee0293ad06c453e78cf89bddcb613b91f82ea5587f3787611ee62861b"
+SRC_URI[sha256sum] = "36ef2d58f600be2973f694f45a55a5502de705d7594f9cf841276aec9082c414"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.17.1


--===============6044108275247419651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.13.7.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.13.14.tar.gz"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.13.7" to "6.13.14"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.13.7 [default] to 6.13.14 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.13.7" to "6.13.14"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.13.7 [default] to 6.13.14 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.13.7" to "6.13.14"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.13.7 [default] to 6.13.14 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.13.7" to "6.13.14"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.13.7 [default] to 6.13.14 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.13.7" to "6.13.14"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.13.7 [default] to 6.13.14 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.13.7" to "6.13.14"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.13.7 [default] to 6.13.14 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.13.7" to "6.13.14"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.13.7 [default] to 6.13.14 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.13.7" to "6.13.14"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.13.7 [default] to 6.13.14 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 1884904 to 1883146 (-0%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/dependency_links.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/entry_points.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/not-zip-safe was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/PKG-INFO was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/requires.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/SOURCES.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.14-py3.9.egg-info/top_level.txt was added
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/dependency_links.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/entry_points.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/not-zip-safe was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/PKG-INFO was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/requires.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/SOURCES.txt was removed
  /usr/lib/python3.9/site-packages/hypothesis-6.13.7-py3.9.egg-info/top_level.txt was removed

--===============6044108275247419651==--
