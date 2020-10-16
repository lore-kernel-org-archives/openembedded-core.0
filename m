Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12219.1602843682980813705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5A18A38C1760
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dmidecode: upgrading to 3.3 SUCCEEDED
Message-ID: <MADEUP.163E71D67E0485FB.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143423
Content-Type: multipart/mixed; boundary="===============2183756585384445829=="

--===============2183756585384445829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dmidecode* to *3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dmidecode-upgrade-3.2-3.3.patch
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

--===============2183756585384445829==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dmidecode-upgrade-3.2-3.3.patch"

From 02a88468e4a06dcfadbb3456a3b8f9850096344c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 02:27:22 +0000
Subject: [PATCH] dmidecode: upgrade 3.2 -> 3.3

---
 .../0001-Committing-changes-from-do_unpack_extra.patch   | 9 +++++----
 .../dmidecode/{dmidecode_3.2.bb => dmidecode_3.3.bb}     | 3 +--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.2.bb => dmidecode_3.3.bb} (82%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch b/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
index ce9d423104..d082459ca9 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
@@ -1,20 +1,21 @@
-From 00a3ace35d66e7ae60046e254a4d00f0f9c1abe2 Mon Sep 17 00:00:00 2001
+From 2c0437f47eaaf565aaccf0c0d150d5fc0fc734f5 Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Thu, 22 Nov 2018 12:05:04 +0000
 Subject: [PATCH] Do not install to /usr/local
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 77c9310..fc378fd 100644
+index 7aa729d..e079b18 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -30,7 +30,7 @@ CFLAGS += -O2
- LDFLAGS =
+@@ -31,7 +31,7 @@ CFLAGS += -D_FILE_OFFSET_BITS=64
+ LDFLAGS ?=
  
  DESTDIR =
 -prefix  = /usr/local
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
similarity index 82%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
index 63f4061cb7..3fc2b20f22 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
@@ -19,6 +19,5 @@ do_install() {
 	oe_runmake DESTDIR="${D}" install
 }
 
-SRC_URI[md5sum] = "9cc2e27e74ade740a25b1aaf0412461b"
-SRC_URI[sha256sum] = "077006fa2da0d06d6383728112f2edef9684e9c8da56752e97cd45a11f838edd"
+SRC_URI[sha256sum] = "82c737a780614c38a783e8055340d295e332fb12c7f418b5d21a0797d3fb1455"
 
-- 
2.18.4


--===============2183756585384445829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PKGSIZE changed from 361976 to 311196 (-14%)

--===============2183756585384445829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1387 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
ERROR: Nothing PROVIDES 'dmidecode'
dmidecode was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2183756585384445829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PKGSIZE changed from 361976 to 311196 (-14%)
packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PV changed from "3.2" to "3.3"
packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PKGV changed from 3.2 [default] to 3.3 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-dev: PV changed from "3.2" to "3.3"
packages/core2-32-poky-linux/dmidecode/dmidecode-dev: PKGV changed from 3.2 [default] to 3.3 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PKGSIZE changed from 26395 to 28360 (+7%)
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PV changed from "3.2" to "3.3"
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PKGV changed from 3.2 [default] to 3.3 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-locale: PV changed from "3.2" to "3.3"
packages/core2-32-poky-linux/dmidecode/dmidecode-locale: PKGV changed from 3.2 [default] to 3.3 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PKGSIZE changed from 202621 to 209316 (+3%)
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PV changed from "3.2" to "3.3"
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PKGV changed from 3.2 [default] to 3.3 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-staticdev: PV changed from "3.2" to "3.3"
packages/core2-32-poky-linux/dmidecode/dmidecode-staticdev: PKGV changed from 3.2 [default] to 3.3 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode: PKGSIZE changed from 178396 to 174300 (-2%)
packages/core2-32-poky-linux/dmidecode/dmidecode: PV changed from "3.2" to "3.3"
packages/core2-32-poky-linux/dmidecode/dmidecode: PKGV changed from 3.2 [default] to 3.3 [default]
packages/core2-32-poky-linux/dmidecode: PV changed from "3.2" to "3.3"
packages/core2-32-poky-linux/dmidecode: PKGV changed from 3.2 [default] to 3.3 [default]

--===============2183756585384445829==--
