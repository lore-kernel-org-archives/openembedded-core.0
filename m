Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.357.1615826521192946096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id EF73C38C12A7
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 5.0.2 SUCCEEDED
Message-ID: <MADEUP.166C91A8FD1DF320.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149494
Content-Type: multipart/mixed; boundary="===============2532810755815592145=="

--===============2532810755815592145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-scm* to *5.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-5.0.1-5.0.2.patch
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

--===============2532810755815592145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-scm: PKGV changed from 5.0.1 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-5.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-5.0.2.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-scm: PV changed from "5.0.1" to "5.0.2"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 5.0.1 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "5.0.1" to "5.0.2"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 5.0.1 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "5.0.1" to "5.0.2"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 5.0.1 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "5.0.1" to "5.0.2"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 5.0.1 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "5.0.1" to "5.0.2"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 5.0.1 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "5.0.1" to "5.0.2"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 5.0.1 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "5.0.1" to "5.0.2"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 121854 to 123393 (+1%)
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 5.0.1 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "5.0.1" to "5.0.2"
Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-5.0.2-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-5.0.2-py3.9.egg-info

--===============2532810755815592145==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-5.0.1-5.0.2.patch"

From 6106e636c748690b1e54561418a6ec958ba15e91 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 06:22:52 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 5.0.1 -> 5.0.2

---
 ...-setuptools-scm_5.0.1.bb => python3-setuptools-scm_5.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_5.0.1.bb => python3-setuptools-scm_5.0.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb b/meta/recipes-devtools/python/python3-setuptools-scm_5.0.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_5.0.2.bb
index ead80da7b4..dd74aef2b1 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_5.0.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "c85b6b46d0edd40d2301038cdea96bb6adc14d62ef943e75afb08b3e7bcf142a"
+SRC_URI[sha256sum] = "83a0cedd3449e3946307811a4c7b9d89c4b5fd464a2fb5eeccd0a5bb158ae5c8"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
-- 
2.17.1


--===============2532810755815592145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-5.0.2-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-5.0.2-py3.9.egg-info

--===============2532810755815592145==--
