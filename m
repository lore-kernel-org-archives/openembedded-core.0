Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.39205.1605551304035842369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2873138C11F9
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.19.4 SUCCEEDED
Message-ID: <MADEUP.1648106790B728EE.12355@lists.openembedded.org>
X-Groupsio-MsgNum: 144642
Content-Type: multipart/mixed; boundary="===============2494994172233239663=="

--===============2494994172233239663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.19.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.19.3-1.19.4.patch
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

--===============2494994172233239663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.19.3-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.19.4-py3.9.egg-info

--===============2494994172233239663==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.19.3-1.19.4.patch"

From 805a4315b3d08b7490bccbe3219c45abce28fde4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 14:30:14 +0000
Subject: [PATCH] python3-numpy: upgrade 1.19.3 -> 1.19.4

---
 meta/recipes-devtools/python-numpy/python-numpy.inc             | 2 +-
 .../{python3-numpy_1.19.3.bb => python3-numpy_1.19.4.bb}        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.19.3.bb => python3-numpy_1.19.4.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index b1058b26c8..bb7d59ba58 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -8,7 +8,7 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            "
-SRC_URI[sha256sum] = "9179d259a9bc53ed7b153d31fc3156d1ca560d61079f53191cf177c3efc4a498"
+SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
-- 
2.20.1


--===============2494994172233239663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.19.3/numpy-1.19.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch" to "https://github.com/numpy/numpy/releases/download/v1.19.4/numpy-1.19.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 254474 to 254466 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.19.3" to "1.19.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 26328157 to 26329557 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.19.3 [default] to 1.19.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.19.3" to "1.19.4"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.9/site-packages/numpy-1.19.3-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/numpy-1.19.4-py3.9.egg-info

--===============2494994172233239663==--
