Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.4491.1621074783398317594
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 120A638C1364
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.20.3 SUCCEEDED
Message-ID: <MADEUP.167F36ED5A89BD7D.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151797
Content-Type: multipart/mixed; boundary="===============4523819820552389035=="

--===============4523819820552389035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.20.2-1.20.3.patch
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

--===============4523819820552389035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.20.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.20.3-py3.9.egg-info

--===============4523819820552389035==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.20.2-1.20.3.patch"

From 83fd32e860ee7c94c8c7e49b9e5de160fdcd3db9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 04:48:30 +0000
Subject: [PATCH] python3-numpy: upgrade 1.20.2 -> 1.20.3

---
 .../{python3-numpy_1.20.2.bb => python3-numpy_1.20.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.20.2.bb => python3-numpy_1.20.3.bb} (96%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb
similarity index 96%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb
index 0a60ca7467..d160fd655b 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "c049f410c78e76ffb0af830a8afbdf8baac09897b4152b97b1a3b8345ee338ff"
+SRC_URI[sha256sum] = "b7340f0628ce1823c151e3d2a2a8cba2a3ff1357fba4475a24b1816e75c21f90"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.27.0


--===============4523819820552389035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.20.2/numpy-1.20.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.20.3/numpy-1.20.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 29056792 to 29058164 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 17842490 to 17844165 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 258668 to 258660 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 29133227 to 29127185 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.20.2" to "1.20.3"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.20.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.20.3-py3.9.egg-info

--===============4523819820552389035==--
