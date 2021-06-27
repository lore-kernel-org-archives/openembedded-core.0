Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5883.1624805202663018503
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id EC1EF38C128C
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libglu: upgrading to 9.0.2 SUCCEEDED
Message-ID: <MADEUP.168C77B92D3E8850.29174@lists.openembedded.org>
X-Groupsio-MsgNum: 153308
Content-Type: multipart/mixed; boundary="===============8804507071625717157=="

--===============8804507071625717157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libglu* to *9.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libglu-upgrade-9.0.1-9.0.2.patch
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

--===============8804507071625717157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libglu/libglu-dev: PKGSIZE changed from 20805 to 17427 (-16%)
Changes to packages/core2-32-poky-linux/libglu (sysroot):
  /usr/include/GL/glu_mangle.h was removed

--===============8804507071625717157==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libglu-upgrade-9.0.1-9.0.2.patch"

From 4760c1e0b584bbd028f8dbd5aa54117f2a1efc32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 13:02:00 +0000
Subject: [PATCH] libglu: upgrade 9.0.1 -> 9.0.2

---
 .../mesa/{libglu_9.0.1.bb => libglu_9.0.2.bb}                 | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-graphics/mesa/{libglu_9.0.1.bb => libglu_9.0.2.bb} (84%)

diff --git a/meta/recipes-graphics/mesa/libglu_9.0.1.bb b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
similarity index 84%
rename from meta/recipes-graphics/mesa/libglu_9.0.1.bb
rename to meta/recipes-graphics/mesa/libglu_9.0.2.bb
index 703f131f79..ae18f86532 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.1.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
@@ -10,12 +10,10 @@ LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b35645
 
 # Epoch as this used to be part of mesa
 PE = "2"
-PR = "0"
 
 SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5599a0e0a97335e10239d9165aced60d"
-SRC_URI[sha256sum] = "f6f484cfcd51e489afe88031afdea1e173aa652697e4c19ddbcb8260579a10f7"
+SRC_URI[sha256sum] = "24effdfb952453cc00e275e1c82ca9787506aba0282145fff054498e60e19a65"
 
 S = "${WORKDIR}/glu-${PV}"
 
-- 
2.17.1


--===============8804507071625717157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libglu: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-32-poky-linux/libglu: PKGR changed from 0 [default] to r0 [default]
packages/core2-32-poky-linux/libglu: PV changed from "9.0.1" to "9.0.2"
packages/core2-32-poky-linux/libglu: PR changed from "0" to "r0"
packages/core2-32-poky-linux/libglu: SRC_URI changed from "https://mesa.freedesktop.org/archive/glu/glu-9.0.1.tar.gz" to "https://mesa.freedesktop.org/archive/glu/glu-9.0.2.tar.gz"
packages/core2-32-poky-linux/libglu/libglu-dbg: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-32-poky-linux/libglu/libglu-dbg: PKGR changed from 0 [default] to r0 [default]
packages/core2-32-poky-linux/libglu/libglu-dbg: PV changed from "9.0.1" to "9.0.2"
packages/core2-32-poky-linux/libglu/libglu-dbg: PR changed from "0" to "r0"
packages/core2-32-poky-linux/libglu/libglu-dev: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-32-poky-linux/libglu/libglu-dev: PKGSIZE changed from 20805 to 17427 (-16%)
packages/core2-32-poky-linux/libglu/libglu-dev: PKGR changed from 0 [default] to r0 [default]
packages/core2-32-poky-linux/libglu/libglu-dev: PV changed from "9.0.1" to "9.0.2"
packages/core2-32-poky-linux/libglu/libglu-dev: PR changed from "0" to "r0"
packages/core2-32-poky-linux/libglu/libglu-doc: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-32-poky-linux/libglu/libglu-doc: PKGR changed from 0 [default] to r0 [default]
packages/core2-32-poky-linux/libglu/libglu-doc: PV changed from "9.0.1" to "9.0.2"
packages/core2-32-poky-linux/libglu/libglu-doc: PR changed from "0" to "r0"
packages/core2-32-poky-linux/libglu/libglu-locale: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-32-poky-linux/libglu/libglu-locale: PKGR changed from 0 [default] to r0 [default]
packages/core2-32-poky-linux/libglu/libglu-locale: PV changed from "9.0.1" to "9.0.2"
packages/core2-32-poky-linux/libglu/libglu-locale: PR changed from "0" to "r0"
packages/core2-32-poky-linux/libglu/libglu-src: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-32-poky-linux/libglu/libglu-src: PKGSIZE changed from 1661958 to 1661939 (-0%)
packages/core2-32-poky-linux/libglu/libglu-src: PKGR changed from 0 [default] to r0 [default]
packages/core2-32-poky-linux/libglu/libglu-src: PV changed from "9.0.1" to "9.0.2"
packages/core2-32-poky-linux/libglu/libglu-src: PR changed from "0" to "r0"
packages/core2-32-poky-linux/libglu/libglu-staticdev: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-32-poky-linux/libglu/libglu-staticdev: PKGR changed from 0 [default] to r0 [default]
packages/core2-32-poky-linux/libglu/libglu-staticdev: PV changed from "9.0.1" to "9.0.2"
packages/core2-32-poky-linux/libglu/libglu-staticdev: PR changed from "0" to "r0"
packages/core2-32-poky-linux/libglu/libglu: PKGV changed from 9.0.1 [default] to 9.0.2 [default]
packages/core2-32-poky-linux/libglu/libglu: PKGR changed from 0 [default] to r0 [default]
packages/core2-32-poky-linux/libglu/libglu: PV changed from "9.0.1" to "9.0.2"
packages/core2-32-poky-linux/libglu/libglu: PR changed from "0" to "r0"
Changes to packages/core2-32-poky-linux/libglu (sysroot):
  /usr/include/GL/glu_mangle.h was removed

--===============8804507071625717157==--
