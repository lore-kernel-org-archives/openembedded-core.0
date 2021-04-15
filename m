Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1289.1618510599557339342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 28D2238C13D5
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.20.2 SUCCEEDED
Message-ID: <MADEUP.16761AD0E2BD5830.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150510
Content-Type: multipart/mixed; boundary="===============5029423442436599591=="

--===============5029423442436599591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.20.1-1.20.2.patch
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

--===============5029423442436599591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.20.2-py3.9.egg-info

--===============5029423442436599591==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.20.1-1.20.2.patch"

From 447b4d9f5f2af9d679b7583fb976c8e4c8edee83 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 05:50:01 +0000
Subject: [PATCH] python3-numpy: upgrade 1.20.1 -> 1.20.2

---
 .../{python3-numpy_1.20.1.bb => python3-numpy_1.20.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.20.1.bb => python3-numpy_1.20.2.bb} (96%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
similarity index 96%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
index 6c3b886782..0a60ca7467 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "9bf51d69ebb4ca9239e55bedc2185fe2c0ec222da0adee7ece4125414676846d"
+SRC_URI[sha256sum] = "c049f410c78e76ffb0af830a8afbdf8baac09897b4152b97b1a3b8345ee338ff"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.27.0


--===============5029423442436599591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.20.1/numpy-1.20.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.20.2/numpy-1.20.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 30985968 to 30993640 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 17807853 to 17810904 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 28704728 to 28731819 (+0%)
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.20.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.20.2-py3.9.egg-info

--===============5029423442436599591==--
