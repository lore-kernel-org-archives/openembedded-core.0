Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12222.1602843683341884250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id B820738C17AA
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20200925 SUCCEEDED
Message-ID: <MADEUP.163E71D6BA9A3AB8.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143441
Content-Type: multipart/mixed; boundary="===============6150958950682501101=="

--===============6150958950682501101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpica* to *20200925* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20200717-20200925.patch
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

--===============6150958950682501101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1423 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6150958950682501101==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20200717-20200925.patch"

From 52877f7bf04d0a38bfde8646d9582f418497c9e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 05:45:04 +0000
Subject: [PATCH] acpica: upgrade 20200717 -> 20200925

---
 .../acpica/{acpica_20200717.bb => acpica_20200925.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20200717.bb => acpica_20200925.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20200717.bb b/meta/recipes-extended/acpica/acpica_20200925.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20200717.bb
rename to meta/recipes-extended/acpica/acpica_20200925.bb
index d1d06c0c24..a6d8d67270 100644
--- a/meta/recipes-extended/acpica/acpica_20200717.bb
+++ b/meta/recipes-extended/acpica/acpica_20200925.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "cb99903ef240732f395af40c23b9b19c7899033f48840743544eebb6da72a828"
+SRC_URI[sha256sum] = "d44388e21e3d2e47c6d39e9c897935d3f775f04fec76271dcba072c74f834589"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.18.4


--===============6150958950682501101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1423 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6150958950682501101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 9036136 to 9043068 (+0%)
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGV changed from 20200717 [default] to 20200925 [default]
packages/core2-32-poky-linux/acpica/acpica-dbg: PV changed from "20200717" to "20200925"
packages/core2-32-poky-linux/acpica/acpica-dev: PKGV changed from 20200717 [default] to 20200925 [default]
packages/core2-32-poky-linux/acpica/acpica-dev: PV changed from "20200717" to "20200925"
packages/core2-32-poky-linux/acpica/acpica-doc: PKGV changed from 20200717 [default] to 20200925 [default]
packages/core2-32-poky-linux/acpica/acpica-doc: PV changed from "20200717" to "20200925"
packages/core2-32-poky-linux/acpica/acpica-locale: PKGV changed from 20200717 [default] to 20200925 [default]
packages/core2-32-poky-linux/acpica/acpica-locale: PV changed from "20200717" to "20200925"
packages/core2-32-poky-linux/acpica/acpica-src: PKGSIZE changed from 10239928 to 10250893 (+0%)
packages/core2-32-poky-linux/acpica/acpica-src: PKGV changed from 20200717 [default] to 20200925 [default]
packages/core2-32-poky-linux/acpica/acpica-src: PV changed from "20200717" to "20200925"
packages/core2-32-poky-linux/acpica/acpica-staticdev: PKGV changed from 20200717 [default] to 20200925 [default]
packages/core2-32-poky-linux/acpica/acpica-staticdev: PV changed from "20200717" to "20200925"
packages/core2-32-poky-linux/acpica/acpica: PKGSIZE changed from 2577052 to 2589340 (+0%)
packages/core2-32-poky-linux/acpica/acpica: PKGV changed from 20200717 [default] to 20200925 [default]
packages/core2-32-poky-linux/acpica/acpica: PV changed from "20200717" to "20200925"
packages/core2-32-poky-linux/acpica: PV changed from "20200717" to "20200925"
packages/core2-32-poky-linux/acpica: PKGV changed from 20200717 [default] to 20200925 [default]

--===============6150958950682501101==--
