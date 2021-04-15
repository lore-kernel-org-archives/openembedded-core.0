Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1328.1618510599548439712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 86FA138C1404
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20210331 SUCCEEDED
Message-ID: <MADEUP.16761AD1246DADC1.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150535
Content-Type: multipart/mixed; boundary="===============8992658283751452603=="

--===============8992658283751452603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *acpica* to *20210331* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20210105-20210331.patch
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

--===============8992658283751452603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8992658283751452603==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20210105-20210331.patch"

From bf9596b1c0d98fa9ddc6df008a89bd43e4a2fd74 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 08:19:45 +0000
Subject: [PATCH] acpica: upgrade 20210105 -> 20210331

---
 .../acpica/{acpica_20210105.bb => acpica_20210331.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20210105.bb => acpica_20210331.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20210105.bb b/meta/recipes-extended/acpica/acpica_20210331.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20210105.bb
rename to meta/recipes-extended/acpica/acpica_20210331.bb
index 0188dc8a1b..e17bc94c39 100644
--- a/meta/recipes-extended/acpica/acpica_20210105.bb
+++ b/meta/recipes-extended/acpica/acpica_20210331.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a9be7b749025e60f93fde2fe531bfe0d84a33641d3e0c9b0f6049f996dbb1ff8"
+SRC_URI[sha256sum] = "b49237a2c3df58b57310612ec3a6ebee69e1a525b5efeec7152faf32a03b7068"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.27.0


--===============8992658283751452603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
ERROR: Nothing PROVIDES 'acpica'
acpica was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8992658283751452603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 9041516 to 9081676 (+0%)
packages/core2-32-poky-linux/acpica/acpica-dbg: PV changed from "20210105" to "20210331"
packages/core2-32-poky-linux/acpica/acpica-dbg: PKGV changed from 20210105 [default] to 20210331 [default]
packages/core2-32-poky-linux/acpica/acpica-dev: PV changed from "20210105" to "20210331"
packages/core2-32-poky-linux/acpica/acpica-dev: PKGV changed from 20210105 [default] to 20210331 [default]
packages/core2-32-poky-linux/acpica/acpica-doc: PV changed from "20210105" to "20210331"
packages/core2-32-poky-linux/acpica/acpica-doc: PKGV changed from 20210105 [default] to 20210331 [default]
packages/core2-32-poky-linux/acpica/acpica-locale: PV changed from "20210105" to "20210331"
packages/core2-32-poky-linux/acpica/acpica-locale: PKGV changed from 20210105 [default] to 20210331 [default]
packages/core2-32-poky-linux/acpica/acpica-src: PKGSIZE changed from 10246531 to 10324148 (+1%)
packages/core2-32-poky-linux/acpica/acpica-src: PV changed from "20210105" to "20210331"
packages/core2-32-poky-linux/acpica/acpica-src: PKGV changed from 20210105 [default] to 20210331 [default]
packages/core2-32-poky-linux/acpica/acpica-staticdev: PV changed from "20210105" to "20210331"
packages/core2-32-poky-linux/acpica/acpica-staticdev: PKGV changed from 20210105 [default] to 20210331 [default]
packages/core2-32-poky-linux/acpica/acpica: PKGSIZE changed from 2598780 to 2621700 (+1%)
packages/core2-32-poky-linux/acpica/acpica: PV changed from "20210105" to "20210331"
packages/core2-32-poky-linux/acpica/acpica: PKGV changed from 20210105 [default] to 20210331 [default]
packages/core2-32-poky-linux/acpica: SRC_URI changed from "https://acpica.org/sites/acpica/files/acpica-unix-20210105.tar.gz" to "https://acpica.org/sites/acpica/files/acpica-unix-20210331.tar.gz"
packages/core2-32-poky-linux/acpica: PV changed from "20210105" to "20210331"
packages/core2-32-poky-linux/acpica: PKGV changed from 20210105 [default] to 20210331 [default]

--===============8992658283751452603==--
