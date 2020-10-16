Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12220.1602843683020080320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 930AA38C179A
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.20.0 SUCCEEDED
Message-ID: <MADEUP.163E71D6A20D74CA.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143437
Content-Type: multipart/mixed; boundary="===============6769560770383123016=="

--===============6769560770383123016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycairo* to *1.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.19.1-1.20.0.patch
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

--===============6769560770383123016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info moved to /usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info

--===============6769560770383123016==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.19.1-1.20.0.patch"

From 0035158ca67847576c4439a5abe8559d5d188ff5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 04:23:02 +0000
Subject: [PATCH] python3-pycairo: upgrade 1.19.1 -> 1.20.0

---
 .../{python3-pycairo_1.19.1.bb => python3-pycairo_1.20.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.19.1.bb => python3-pycairo_1.20.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
index 34c8543bce..50a2ba845d 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
@@ -13,8 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "59bc5c5d1debc3af0f6791af9d612551"
-SRC_URI[sha256sum] = "2c143183280feb67f5beb4e543fd49990c28e7df427301ede04fc550d3562e84"
+SRC_URI[sha256sum] = "5695a10cb7f9ae0d01f665b56602a845b0a8cb17e2123bfece10c2e58552468c"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.18.4


--===============6769560770383123016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycairo: PV changed from "1.19.1" to "1.20.0"
packages/core2-32-poky-linux/python3-pycairo: PKGV changed from 1.19.1 [default] to 1.20.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.19.1" to "1.20.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.19.1 [default] to 1.20.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGSIZE changed from 397268 to 398088 (+0%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.19.1" to "1.20.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.19.1 [default] to 1.20.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PKGSIZE changed from 9335 to 8954 (-4%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.19.1" to "1.20.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.19.1 [default] to 1.20.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.19.1" to "1.20.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.19.1 [default] to 1.20.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.19.1" to "1.20.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.19.1 [default] to 1.20.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 367468 to 358641 (-2%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.19.1" to "1.20.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.19.1 [default] to 1.20.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.19.1" to "1.20.0"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.19.1 [default] to 1.20.0 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGSIZE changed from 246270 to 245591 (-0%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info", added "/usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info"
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.8/site-packages/pycairo-1.19.1.egg-info moved to /usr/lib/python3.8/site-packages/pycairo-1.20.0.egg-info
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1148564 to 1148548 (-0%)

--===============6769560770383123016==--
