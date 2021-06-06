Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.25798.1623000257717139341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2E66438C127D
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libogg: upgrading to 1.3.5 SUCCEEDED
Message-ID: <MADEUP.16860E22D1ACA4B0.27789@lists.openembedded.org>
X-Groupsio-MsgNum: 152718
Content-Type: multipart/mixed; boundary="===============3235336668214993554=="

--===============3235336668214993554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libogg* to *1.3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libogg-upgrade-1.3.4-1.3.5.patch
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

--===============3235336668214993554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libogg/libogg-dev: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-doc: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-locale: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-staticdev: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
Changes to packages/core2-32-poky-linux/libogg (sysroot):
  /usr/lib/libogg.so.0 changed symlink target from libogg.so.0.8.4 to libogg.so.0.8.5
  /usr/lib/libogg.so changed symlink target from libogg.so.0.8.4 to libogg.so.0.8.5
  /usr/lib/libogg.so.0.8.4 moved to /usr/lib/libogg.so.0.8.5

--===============3235336668214993554==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libogg-upgrade-1.3.4-1.3.5.patch"

From af123d0db920f5c8b02aa1d819c383c75e4cd915 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 15:45:30 +0000
Subject: [PATCH] libogg: upgrade 1.3.4 -> 1.3.5

---
 .../libogg/{libogg_1.3.4.bb => libogg_1.3.5.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.3.4.bb => libogg_1.3.5.bb} (80%)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.4.bb b/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
similarity index 80%
rename from meta/recipes-multimedia/libogg/libogg_1.3.4.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.5.bb
index c4004619b9..402d700aa1 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.4.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.5.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
 
 SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "eadef24aad6e3e8379ba0d14971fd64a"
-SRC_URI[sha256sum] = "c163bc12bc300c401b6aa35907ac682671ea376f13ae0969a220f7ddf71893fe"
+SRC_URI[sha256sum] = "c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705"
 
 inherit autotools pkgconfig
-- 
2.17.1


--===============3235336668214993554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libogg: SRC_URI changed from "http://downloads.xiph.org/releases/ogg/libogg-1.3.4.tar.xz" to "http://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.xz"
packages/core2-32-poky-linux/libogg: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libogg: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libogg/libogg-dbg: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-dbg: PKGSIZE changed from 38700 to 38712 (+0%)
packages/core2-32-poky-linux/libogg/libogg-dbg: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libogg/libogg-dbg: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libogg/libogg-dev: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-dev: PKGSIZE changed from 17911 to 17914 (+0%)
packages/core2-32-poky-linux/libogg/libogg-dev: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libogg/libogg-dev: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libogg/libogg-doc: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-doc: PKGSIZE changed from 391994 to 391999 (+0%)
packages/core2-32-poky-linux/libogg/libogg-doc: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libogg/libogg-doc: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libogg/libogg-locale: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-locale: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libogg/libogg-locale: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libogg/libogg-src: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-src: PKGSIZE changed from 129329 to 129437 (+0%)
packages/core2-32-poky-linux/libogg/libogg-src: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libogg/libogg-src: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libogg/libogg-staticdev: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg-staticdev: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libogg/libogg-staticdev: PV changed from "1.3.4" to "1.3.5"
packages/core2-32-poky-linux/libogg/libogg: FILELIST: removed "/usr/lib/libogg.so.0.8.4", added "/usr/lib/libogg.so.0.8.5"
packages/core2-32-poky-linux/libogg/libogg: PKGV changed from 1.3.4 [default] to 1.3.5 [default]
packages/core2-32-poky-linux/libogg/libogg: PV changed from "1.3.4" to "1.3.5"
Changes to packages/core2-32-poky-linux/libogg (sysroot):
  /usr/lib/libogg.so.0 changed symlink target from libogg.so.0.8.4 to libogg.so.0.8.5
  /usr/lib/libogg.so changed symlink target from libogg.so.0.8.4 to libogg.so.0.8.5
  /usr/lib/libogg.so.0.8.4 moved to /usr/lib/libogg.so.0.8.5

--===============3235336668214993554==--
