Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.286.1615826521123335023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id D479138C1290
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libedit: upgrading to 20210216-3.1 SUCCEEDED
Message-ID: <MADEUP.166C91A8F97AAF64.27320@lists.openembedded.org>
X-Groupsio-MsgNum: 149491
Content-Type: multipart/mixed; boundary="===============1698301333956711792=="

--===============1698301333956711792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libedit* to *20210216-3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libedit-upgrade-20191231-3.1-20210216-3.1.patch
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

--===============1698301333956711792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libedit: PV changed from "20191231-3.1" to "20210216-3.1"
packages/core2-32-poky-linux/libedit: SRC_URI changed from "http://www.thrysoee.dk/editline/libedit-20191231-3.1.tar.gz file://stdc-predef.patch" to "http://www.thrysoee.dk/editline/libedit-20210216-3.1.tar.gz file://stdc-predef.patch"
packages/core2-32-poky-linux/libedit: PKGV changed from 20191231-3.1 [default] to 20210216-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dbg: PV changed from "20191231-3.1" to "20210216-3.1"
packages/core2-32-poky-linux/libedit/libedit-dbg: PKGSIZE changed from 517260 to 517184 (-0%)
packages/core2-32-poky-linux/libedit/libedit-dbg: PKGV changed from 20191231-3.1 [default] to 20210216-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dbg: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit-dev: PV changed from "20191231-3.1" to "20210216-3.1"
packages/core2-32-poky-linux/libedit/libedit-dev: PKGV changed from 20191231-3.1 [default] to 20210216-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dev: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit-doc: PV changed from "20191231-3.1" to "20210216-3.1"
packages/core2-32-poky-linux/libedit/libedit-doc: PKGV changed from 20191231-3.1 [default] to 20210216-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-doc: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit-locale: PV changed from "20191231-3.1" to "20210216-3.1"
packages/core2-32-poky-linux/libedit/libedit-locale: PKGV changed from 20191231-3.1 [default] to 20210216-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-locale: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit-src: PV changed from "20191231-3.1" to "20210216-3.1"
packages/core2-32-poky-linux/libedit/libedit-src: PKGSIZE changed from 578860 to 578903 (+0%)
packages/core2-32-poky-linux/libedit/libedit-src: PKGV changed from 20191231-3.1 [default] to 20210216-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-src: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit-staticdev: PV changed from "20191231-3.1" to "20210216-3.1"
packages/core2-32-poky-linux/libedit/libedit-staticdev: PKGV changed from 20191231-3.1 [default] to 20210216-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-staticdev: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit: PV changed from "20191231-3.1" to "20210216-3.1"
packages/core2-32-poky-linux/libedit/libedit: PKGV changed from 20191231-3.1 [default] to 20210216-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
Changes to packages/core2-32-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.63 to libedit.so.0.0.64
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.63 to libedit.so.0.0.64
  /usr/lib/libedit.so.0.0.63 moved to /usr/lib/libedit.so.0.0.64

--===============1698301333956711792==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libedit-upgrade-20191231-3.1-20210216-3.1.patch"

From 833069d4e53d8be678ff85a254169ad8992b1089 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 06:08:17 +0000
Subject: [PATCH] libedit: upgrade 20191231-3.1 -> 20210216-3.1

---
 .../{libedit_20191231-3.1.bb => libedit_20210216-3.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/libedit/{libedit_20191231-3.1.bb => libedit_20210216-3.1.bb} (82%)

diff --git a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
similarity index 82%
rename from meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
index 8d2d57a930..97aceaf716 100644
--- a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210216-3.1.bb
@@ -13,8 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[md5sum] = "2e22a51131de94ff2df24901f7cfe416"
-SRC_URI[sha256sum] = "dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071"
+SRC_URI[sha256sum] = "2283f741d2aab935c8c52c04b57bf952d02c2c02e651172f8ac811f77b1fc77a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


--===============1698301333956711792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libedit/libedit-dev: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit-doc: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit-locale: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit-staticdev: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
packages/core2-32-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.63", added "/usr/lib/libedit.so.0.0.64"
Changes to packages/core2-32-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.63 to libedit.so.0.0.64
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.63 to libedit.so.0.0.64
  /usr/lib/libedit.so.0.0.63 moved to /usr/lib/libedit.so.0.0.64

--===============1698301333956711792==--
