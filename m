Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.285.1615826520929878868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9DCC738C1283
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] e2fsprogs: upgrading to 1.46.2 SUCCEEDED
Message-ID: <MADEUP.166C91A8EECD45E8.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149481
Content-Type: multipart/mixed; boundary="===============6919599780675878858=="

--===============6919599780675878858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *e2fsprogs* to *1.46.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-e2fsprogs-upgrade-1.46.1-1.46.2.patch
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

--===============6919599780675878858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-badblocks: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-badblocks: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dbg: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dbg: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dbg: PKGSIZE changed from 5263740 to 5274224 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dev: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dev: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dev: PKGSIZE changed from 209944 to 209963 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-doc: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-doc: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-doc: PKGSIZE changed from 226131 to 226240 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dumpe2fs: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dumpe2fs: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2fsck: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2fsck: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2scrub: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2scrub: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2scrub: PKGSIZE changed from 12689 to 12691 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ca: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ca: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ca: PKGSIZE changed from 138882 to 138601 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PKGSIZE changed from 185395 to 185139 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-da: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-da: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-da: PKGSIZE changed from 140084 to 139811 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-de: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-de: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-de: PKGSIZE changed from 175553 to 175279 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-eo: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-eo: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-eo: PKGSIZE changed from 87964 to 87698 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-es: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-es: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-es: PKGSIZE changed from 186138 to 190454 (+2%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fi: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fi: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fi: PKGSIZE changed from 20970 to 20780 (-1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PKGSIZE changed from 186500 to 186220 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-hu: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-hu: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-hu: PKGSIZE changed from 172944 to 172645 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-id: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-id: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-id: PKGSIZE changed from 79844 to 79670 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-it: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-it: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-it: PKGSIZE changed from 56016 to 55778 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PKGSIZE changed from 173939 to 173701 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PKGSIZE changed from 181988 to 181725 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PKGSIZE changed from 180476 to 180239 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PKGSIZE changed from 235010 to 234646 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PKGSIZE changed from 177235 to 176986 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-tr: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-tr: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-tr: PKGSIZE changed from 69584 to 69401 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PKGSIZE changed from 245465 to 245146 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-vi: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-vi: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-vi: PKGSIZE changed from 186172 to 185884 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PKGSIZE changed from 155187 to 154948 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-mke2fs: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-mke2fs: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-ptest: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-ptest: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-ptest: PKGSIZE changed from 16647627 to 16652567 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-resize2fs: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-resize2fs: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-src: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-src: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-src: PKGSIZE changed from 3647774 to 3658690 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-staticdev: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-staticdev: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-staticdev: PKGSIZE changed from 2318606 to 2323222 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-tune2fs: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-tune2fs: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/libcomerr: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/libcomerr: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/libe2p: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/libe2p: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/libe2p: PKGSIZE changed from 43485 to 43517 (+0%)
packages/core2-32-poky-linux/e2fsprogs/libext2fs: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/libext2fs: PKGV changed from 1.46.1 [default] to 1.46.2 [default]
packages/core2-32-poky-linux/e2fsprogs/libext2fs: PKGSIZE changed from 524344 to 528440 (+1%)
packages/core2-32-poky-linux/e2fsprogs/libss: PV changed from "1.46.1" to "1.46.2"
packages/core2-32-poky-linux/e2fsprogs/libss: PKGV changed from 1.46.1 [default] to 1.46.2 [default]

--===============6919599780675878858==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-e2fsprogs-upgrade-1.46.1-1.46.2.patch"

From 11f3dbf5ca8b5fe23010a129dddca1347b289104 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 05:49:31 +0000
Subject: [PATCH] e2fsprogs: upgrade 1.46.1 -> 1.46.2

---
 .../e2fsprogs-fix-missing-check-for-permission-denied.patch     | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch   | 2 +-
 .../e2fsprogs/{e2fsprogs_1.46.1.bb => e2fsprogs_1.46.2.bb}      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.1.bb => e2fsprogs_1.46.2.bb} (99%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
index d7c07c3b0f..1d144e81c0 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
@@ -1,4 +1,4 @@
-From 9263b8764702f2b26ddaaf80808ebab31a1dba3b Mon Sep 17 00:00:00 2001
+From 7208d5ee4ec13b35634fb161374f0f5b38d115ed Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 10 Aug 2016 11:19:44 +0800
 Subject: [PATCH] Fix missing check for permission denied.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 88d0ae77c9..5bcc2bd755 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From 6e4c1644a3a8cacf7c1f5953cc378589bb046d5a Mon Sep 17 00:00:00 2001
+From 4da904eb825eda7167371c14c2cd6627cadaa0ed Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
similarity index 99%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
index be8b67c35d..d65cfbec66 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb
@@ -11,7 +11,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
 "
 
 
-SRCREV = "3114c623f56b0d61f5f34b85f7b23d28f6c848c0"
+SRCREV = "1eea0e2bd9a6760ebad834d5d2cf700fffe5ebe2"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.17.1


--===============6919599780675878858==--
