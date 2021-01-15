Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.691.1610713823119434818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id F40D438C1411
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.2.15 SUCCEEDED
Message-ID: <MADEUP.165A67B0DDB90F1E.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146817
Content-Type: multipart/mixed; boundary="===============2413924104119087388=="

--===============2413924104119087388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.2.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.2.14-2.2.15.patch
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

--===============2413924104119087388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/enchant2/enchant2-dev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-doc: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-locale: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
Changes to packages/core2-32-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.2.14 to libenchant-2.so.2.2.15
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.2.14 to libenchant-2.so.2.2.15
  /usr/lib/libenchant-2.so.2.2.14 moved to /usr/lib/libenchant-2.so.2.2.15

--===============2413924104119087388==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.2.14-2.2.15.patch"

From f4d1584dce65a49986cbd1b95db39ada30aad77d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 11:55:53 +0000
Subject: [PATCH] enchant2: upgrade 2.2.14 -> 2.2.15

---
 .../enchant/{enchant2_2.2.14.bb => enchant2_2.2.15.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.14.bb => enchant2_2.2.15.bb} (90%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.14.bb b/meta/recipes-support/enchant/enchant2_2.2.15.bb
similarity index 90%
rename from meta/recipes-support/enchant/enchant2_2.2.14.bb
rename to meta/recipes-support/enchant/enchant2_2.2.15.bb
index a5080d9c78..05e84fc726 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.14.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.15.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "bf7cc9a410b54c29648c7711dc8f210e7b13768508aaf43cc9c4527d5a9c7a8e"
+SRC_URI[sha256sum] = "3b0f2215578115f28e2a6aa549b35128600394304bd79d6f28b0d3b3d6f46c03"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.27.0


--===============2413924104119087388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.2.14 [default] to 2.2.15 [default]
packages/core2-32-poky-linux/enchant2/enchant2-dbg: PV changed from "2.2.14" to "2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.2.14 [default] to 2.2.15 [default]
packages/core2-32-poky-linux/enchant2/enchant2-dev: PV changed from "2.2.14" to "2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-dev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.2.14 [default] to 2.2.15 [default]
packages/core2-32-poky-linux/enchant2/enchant2-doc: PV changed from "2.2.14" to "2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-doc: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.2.14 [default] to 2.2.15 [default]
packages/core2-32-poky-linux/enchant2/enchant2-locale: PV changed from "2.2.14" to "2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-locale: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-src: PKGV changed from 2.2.14 [default] to 2.2.15 [default]
packages/core2-32-poky-linux/enchant2/enchant2-src: PV changed from "2.2.14" to "2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-src: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.2.14 [default] to 2.2.15 [default]
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.2.14" to "2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2-staticdev: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2: PKGV changed from 2.2.14 [default] to 2.2.15 [default]
packages/core2-32-poky-linux/enchant2/enchant2: PV changed from "2.2.14" to "2.2.15"
packages/core2-32-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.2.14", added "/usr/lib/libenchant-2.so.2.2.15"
packages/core2-32-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.2.14/enchant-2.2.14.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.2.15/enchant-2.2.15.tar.gz"
packages/core2-32-poky-linux/enchant2: PKGV changed from 2.2.14 [default] to 2.2.15 [default]
packages/core2-32-poky-linux/enchant2: PV changed from "2.2.14" to "2.2.15"
Changes to packages/core2-32-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.2.14 to libenchant-2.so.2.2.15
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.2.14 to libenchant-2.so.2.2.15
  /usr/lib/libenchant-2.so.2.2.14 moved to /usr/lib/libenchant-2.so.2.2.15

--===============2413924104119087388==--
