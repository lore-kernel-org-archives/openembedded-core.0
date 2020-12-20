Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.24454.1608473714248266822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1D3BB38C1498
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20201217 SUCCEEDED
Message-ID: <MADEUP.165272527239CE9C.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145951
Content-Type: multipart/mixed; boundary="===============4446053138136274583=="

--===============4446053138136274583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpica* to *20201217* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20201113-20201217.patch
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

--===============4446053138136274583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============4446053138136274583==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20201113-20201217.patch"

From 62ce44dec02b2004d95eea2de9fdefc43d69ee34 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 03:26:38 +0000
Subject: [PATCH] acpica: upgrade 20201113 -> 20201217

---
 .../acpica/{acpica_20201113.bb => acpica_20201217.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20201113.bb => acpica_20201217.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20201113.bb b/meta/recipes-extended/acpica/acpica_20201217.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20201113.bb
rename to meta/recipes-extended/acpica/acpica_20201217.bb
index f2d17ca54e..91bcd8a46d 100644
--- a/meta/recipes-extended/acpica/acpica_20201113.bb
+++ b/meta/recipes-extended/acpica/acpica_20201217.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "48c4e0c07b42581d017487cc9264470e6420605ddd24cbb5d16410d02a771461"
+SRC_URI[sha256sum] = "df6bb667c60577c89df5abe3270539c1b9716b69409d1074d6a7fc5c2fea087b"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.20.1


--===============4446053138136274583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpica/acpica-dbg: PKGV changed from 20201113 [default] to 20201217 [default]
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 9047324 to 9047620 (+0%)
packages/core2-32-poky-linux/acpica/acpica-dbg: PV changed from "20201113" to "20201217"
packages/core2-32-poky-linux/acpica/acpica-dev: PKGV changed from 20201113 [default] to 20201217 [default]
packages/core2-32-poky-linux/acpica/acpica-dev: PV changed from "20201113" to "20201217"
packages/core2-32-poky-linux/acpica/acpica-doc: PKGV changed from 20201113 [default] to 20201217 [default]
packages/core2-32-poky-linux/acpica/acpica-doc: PV changed from "20201113" to "20201217"
packages/core2-32-poky-linux/acpica/acpica-locale: PKGV changed from 20201113 [default] to 20201217 [default]
packages/core2-32-poky-linux/acpica/acpica-locale: PV changed from "20201113" to "20201217"
packages/core2-32-poky-linux/acpica/acpica-src: PKGV changed from 20201113 [default] to 20201217 [default]
packages/core2-32-poky-linux/acpica/acpica-src: PKGSIZE changed from 10255428 to 10255707 (+0%)
packages/core2-32-poky-linux/acpica/acpica-src: PV changed from "20201113" to "20201217"
packages/core2-32-poky-linux/acpica/acpica-staticdev: PKGV changed from 20201113 [default] to 20201217 [default]
packages/core2-32-poky-linux/acpica/acpica-staticdev: PV changed from "20201113" to "20201217"
packages/core2-32-poky-linux/acpica/acpica: PKGV changed from 20201113 [default] to 20201217 [default]
packages/core2-32-poky-linux/acpica/acpica: PV changed from "20201113" to "20201217"
packages/core2-32-poky-linux/acpica: SRC_URI changed from "https://acpica.org/sites/acpica/files/acpica-unix-20201113.tar.gz" to "https://acpica.org/sites/acpica/files/acpica-unix-20201217.tar.gz"
packages/core2-32-poky-linux/acpica: PKGV changed from 20201113 [default] to 20201217 [default]
packages/core2-32-poky-linux/acpica: PV changed from "20201113" to "20201217"

--===============4446053138136274583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============4446053138136274583==--
