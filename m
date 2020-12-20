Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.24456.1608473715027681901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id C295738C145D
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.2.14 SUCCEEDED
Message-ID: <MADEUP.16527252EFA5D596.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145990
Content-Type: multipart/mixed; boundary="===============0316547808086688564=="

--===============0316547808086688564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.2.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.2.13-2.2.14.patch
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

--===============0316547808086688564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.2.13 [default] to 2.2.14 [default]
packages/core2-32-poky-linux/enchant2/enchant2-dbg: PV changed from "2.2.13" to "2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-dev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.2.13 [default] to 2.2.14 [default]
packages/core2-32-poky-linux/enchant2/enchant2-dev: PV changed from "2.2.13" to "2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-doc: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.2.13 [default] to 2.2.14 [default]
packages/core2-32-poky-linux/enchant2/enchant2-doc: PV changed from "2.2.13" to "2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-locale: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.2.13 [default] to 2.2.14 [default]
packages/core2-32-poky-linux/enchant2/enchant2-locale: PV changed from "2.2.13" to "2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-src: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-src: PKGV changed from 2.2.13 [default] to 2.2.14 [default]
packages/core2-32-poky-linux/enchant2/enchant2-src: PV changed from "2.2.13" to "2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.2.13 [default] to 2.2.14 [default]
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.2.13" to "2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2: PKGV changed from 2.2.13 [default] to 2.2.14 [default]
packages/core2-32-poky-linux/enchant2/enchant2: PV changed from "2.2.13" to "2.2.14"
packages/core2-32-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.2.13/enchant-2.2.13.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.2.14/enchant-2.2.14.tar.gz"
packages/core2-32-poky-linux/enchant2: PKGV changed from 2.2.13 [default] to 2.2.14 [default]
packages/core2-32-poky-linux/enchant2: PV changed from "2.2.13" to "2.2.14"
Changes to packages/core2-32-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.2.13 to libenchant-2.so.2.2.14
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.2.13 to libenchant-2.so.2.2.14
  /usr/lib/libenchant-2.so.2.2.13 moved to /usr/lib/libenchant-2.so.2.2.14

--===============0316547808086688564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/enchant2/enchant2-dev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-doc: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-locale: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
packages/core2-32-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.13", added "/usr/lib/libenchant-2.so.2.2.14"
Changes to packages/core2-32-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.2.13 to libenchant-2.so.2.2.14
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.2.13 to libenchant-2.so.2.2.14
  /usr/lib/libenchant-2.so.2.2.13 moved to /usr/lib/libenchant-2.so.2.2.14

--===============0316547808086688564==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.2.13-2.2.14.patch"

From 5894d4f38a48276720160563c027e343eca58c31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 13:23:03 +0000
Subject: [PATCH] enchant2: upgrade 2.2.13 -> 2.2.14

---
 .../enchant/{enchant2_2.2.13.bb => enchant2_2.2.14.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.13.bb => enchant2_2.2.14.bb} (90%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.13.bb b/meta/recipes-support/enchant/enchant2_2.2.14.bb
similarity index 90%
rename from meta/recipes-support/enchant/enchant2_2.2.13.bb
rename to meta/recipes-support/enchant/enchant2_2.2.14.bb
index 3b890e733a..a5080d9c78 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.13.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.14.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "eab9f90d79039133660029616e2a684644bd524be5dc43340d4cfc3fb3c68a20"
+SRC_URI[sha256sum] = "bf7cc9a410b54c29648c7711dc8f210e7b13768508aaf43cc9c4527d5a9c7a8e"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.20.1


--===============0316547808086688564==--
