Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.39493.1605551303737590398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id A011A38C13F5
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Denys Dmytriyenko <denys@ti.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lz4: upgrading to 1.9.3 SUCCEEDED
Message-ID: <MADEUP.16481067DF9DFD6E.12355@lists.openembedded.org>
X-Groupsio-MsgNum: 144666
Content-Type: multipart/mixed; boundary="===============1937122183669628294=="

--===============1937122183669628294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lz4* to *1.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lz4-upgrade-1.9.2-1.9.3.patch
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

--===============1937122183669628294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lz4/lz4-dev: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-doc: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-locale: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-staticdev: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
Changes to packages/core2-32-poky-linux/lz4 (sysroot):
  /usr/lib/liblz4.so.1 changed symlink target from liblz4.so.1.9.2 to liblz4.so.1.9.3
  /usr/lib/liblz4.so changed symlink target from liblz4.so.1.9.2 to liblz4.so.1.9.3
  /usr/lib/liblz4.so.1.9.2 moved to /usr/lib/liblz4.so.1.9.3

--===============1937122183669628294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lz4: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/lz4: SRC_URI changed from "git://github.com/lz4/lz4.git file://run-ptest" to "git://github.com/lz4/lz4.git;branch=release file://run-ptest"
packages/core2-32-poky-linux/lz4: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/lz4/lz4-dbg: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-dbg: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/lz4/lz4-dbg: PKGSIZE changed from 39108 to 39536 (+1%)
packages/core2-32-poky-linux/lz4/lz4-dbg: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/lz4/lz4-dev: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-dev: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/lz4/lz4-dev: PKGSIZE changed from 90349 to 90317 (-0%)
packages/core2-32-poky-linux/lz4/lz4-dev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/lz4/lz4-doc: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-doc: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/lz4/lz4-doc: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/lz4/lz4-locale: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-locale: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/lz4/lz4-locale: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/lz4/lz4-src: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-src: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/lz4/lz4-src: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/lz4/lz4-staticdev: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4-staticdev: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/lz4/lz4-staticdev: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
packages/core2-32-poky-linux/lz4/lz4: FILELIST: removed "/usr/lib/liblz4.so.1.9.2", added "/usr/lib/liblz4.so.1.9.3"
packages/core2-32-poky-linux/lz4/lz4: PV changed from "1.9.2" to "1.9.3"
packages/core2-32-poky-linux/lz4/lz4: PKGSIZE changed from 486056 to 498344 (+3%)
packages/core2-32-poky-linux/lz4/lz4: PKGV changed from 1.9.2 [default] to 1.9.3 [default]
Changes to packages/core2-32-poky-linux/lz4 (sysroot):
  /usr/lib/liblz4.so.1 changed symlink target from liblz4.so.1.9.2 to liblz4.so.1.9.3
  /usr/lib/liblz4.so changed symlink target from liblz4.so.1.9.2 to liblz4.so.1.9.3
  /usr/lib/liblz4.so.1.9.2 moved to /usr/lib/liblz4.so.1.9.3

--===============1937122183669628294==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-lz4-upgrade-1.9.2-1.9.3.patch"

From acf4cea02b7e1533998fc0fcd70a20c74c90d97d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 18:28:22 +0000
Subject: [PATCH] lz4: upgrade 1.9.2 -> 1.9.3

---
 meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} (90%)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
similarity index 90%
rename from meta/recipes-support/lz4/lz4_1.9.2.bb
rename to meta/recipes-support/lz4/lz4_1.9.3.bb
index 6510156ed0..00f2dd32fe 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
 
 PE = "1"
 
-SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
+SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
 
-SRC_URI = "git://github.com/lz4/lz4.git \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
            file://run-ptest \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.20.1


--===============1937122183669628294==--
