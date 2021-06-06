Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.25620.1623000257881773383
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2760338C1283
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycairo: upgrading to 1.20.1 SUCCEEDED
Message-ID: <MADEUP.16860E22B97FE6F4.29797@lists.openembedded.org>
X-Groupsio-MsgNum: 152709
Content-Type: multipart/mixed; boundary="===============0448272613951979219=="

--===============0448272613951979219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycairo* to *1.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycairo-upgrade-1.20.0-1.20.1.patch
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

--===============0448272613951979219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info moved to /usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info

--===============0448272613951979219==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pycairo-upgrade-1.20.0-1.20.1.patch"

From f09125d4c14a4932d158527c3eaf0aa2e10e6349 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 09:41:21 +0000
Subject: [PATCH] python3-pycairo: upgrade 1.20.0 -> 1.20.1

---
 .../{python3-pycairo_1.20.0.bb => python3-pycairo_1.20.1.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.20.0.bb => python3-pycairo_1.20.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
index 8987b7a428..c08640f943 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
@@ -13,8 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "a1f9b661a0000c2f42281db933284451"
-SRC_URI[sha256sum] = "5695a10cb7f9ae0d01f665b56602a845b0a8cb17e2123bfece10c2e58552468c"
+SRC_URI[sha256sum] = "1ee72b035b21a475e1ed648e26541b04e5d7e753d75ca79de8c583b25785531b"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.17.1


--===============0448272613951979219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycairo: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-pycairo: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-pycairo: SRC_URI changed from "https://github.com/pygobject/pycairo/releases/download/v1.20.0/pycairo-1.20.0.tar.gz" to "https://github.com/pygobject/pycairo/releases/download/v1.20.1/pycairo-1.20.1.tar.gz"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dbg: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PKGSIZE changed from 8954 to 8961 (+0%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-dev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-doc: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-locale: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGSIZE changed from 358641 to 358648 (+0%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-src: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo-staticdev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGSIZE changed from 245651 to 245658 (+0%)
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: FILELIST: removed "/usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info", added "/usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info"
packages/core2-32-poky-linux/python3-pycairo/python3-pycairo: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
Changes to packages/core2-32-poky-linux/python3-pycairo (sysroot):
  /usr/lib/python3.9/site-packages/pycairo-1.20.0.egg-info moved to /usr/lib/python3.9/site-packages/pycairo-1.20.1.egg-info

--===============0448272613951979219==--
