Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.720.1610713822581751963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1C90A38C12A1
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.19.5 SUCCEEDED
Message-ID: <MADEUP.165A67B0266CA0E9.6799@lists.openembedded.org>
X-Groupsio-MsgNum: 146757
Content-Type: multipart/mixed; boundary="===============7230225553203703732=="

--===============7230225553203703732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.19.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.19.4-1.19.5.patch
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

--===============7230225553203703732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.19.4-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.19.5-py3.9.egg-info

--===============7230225553203703732==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.19.4-1.19.5.patch"

From 8b0021d87187afc9b356bd9073eff887a698e44f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 05:32:23 +0000
Subject: [PATCH] python3-numpy: upgrade 1.19.4 -> 1.19.5

---
 .../{python3-numpy_1.19.4.bb => python3-numpy_1.19.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.19.4.bb => python3-numpy_1.19.5.bb} (95%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
similarity index 95%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
index 2bfc913aa0..5037d2a422 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.5.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
+SRC_URI[sha256sum] = "d1654047d75fb9d55cc3d46f312d5247eec5f4999039874d2f571bb8021d8f0b"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.27.0


--===============7230225553203703732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.19.4/numpy-1.19.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.19.5/numpy-1.19.5.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 25213036 to 25209000 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 17180055 to 17182355 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 254466 to 254462 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.19.4" to "1.19.5"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 26329679 to 26337680 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.19.4 [default] to 1.19.5 [default]
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.19.4-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.19.5-py3.9.egg-info

--===============7230225553203703732==--
