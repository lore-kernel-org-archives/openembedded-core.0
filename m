Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.16268.1623585062281613202
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 31DEB38C13F5
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rng-tools: upgrading to 6.13 SUCCEEDED
Message-ID: <MADEUP.168822031B4D6025.30228@lists.openembedded.org>
X-Groupsio-MsgNum: 152907
Content-Type: multipart/mixed; boundary="===============7409088974261461941=="

--===============7409088974261461941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rng-tools* to *6.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rng-tools-upgrade-6.12-6.13.patch
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

--===============7409088974261461941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rng-tools: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-32-poky-linux/rng-tools: PV changed from "6.12" to "6.13"
packages/core2-32-poky-linux/rng-tools/rng-tools-dbg: PKGSIZE changed from 170964 to 172416 (+1%)
packages/core2-32-poky-linux/rng-tools/rng-tools-dbg: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-dbg: PV changed from "6.12" to "6.13"
packages/core2-32-poky-linux/rng-tools/rng-tools-dev: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-dev: PV changed from "6.12" to "6.13"
packages/core2-32-poky-linux/rng-tools/rng-tools-doc: PKGSIZE changed from 10915 to 11421 (+5%)
packages/core2-32-poky-linux/rng-tools/rng-tools-doc: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-doc: PV changed from "6.12" to "6.13"
packages/core2-32-poky-linux/rng-tools/rng-tools-locale: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-locale: PV changed from "6.12" to "6.13"
packages/core2-32-poky-linux/rng-tools/rng-tools-src: PKGSIZE changed from 101815 to 106334 (+4%)
packages/core2-32-poky-linux/rng-tools/rng-tools-src: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-src: PV changed from "6.12" to "6.13"
packages/core2-32-poky-linux/rng-tools/rng-tools-staticdev: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools-staticdev: PV changed from "6.12" to "6.13"
packages/core2-32-poky-linux/rng-tools/rng-tools: PKGSIZE changed from 84485 to 80429 (-5%)
packages/core2-32-poky-linux/rng-tools/rng-tools: PKGV changed from 6.12 [default] to 6.13 [default]
packages/core2-32-poky-linux/rng-tools/rng-tools: PV changed from "6.12" to "6.13"

--===============7409088974261461941==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-rng-tools-upgrade-6.12-6.13.patch"

From 0e67ab459b1d79fa6c90872bab8ae0126948681a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 11:50:59 +0000
Subject: [PATCH] rng-tools: upgrade 6.12 -> 6.13

---
 .../rng-tools/{rng-tools_6.12.bb => rng-tools_6.13.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.12.bb => rng-tools_6.13.bb} (97%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.12.bb b/meta/recipes-support/rng-tools/rng-tools_6.13.bb
similarity index 97%
rename from meta/recipes-support/rng-tools/rng-tools_6.12.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.13.bb
index 9673700981..fb2fd63c5d 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.12.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.13.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://default \
     file://rngd.service \
 "
-SRCREV = "a2cd12bc253a014328b87137559fd4e1ab296d9b"
+SRCREV = "d8dac0e8bede73e42b3d59f3b48c662ad0032e8c"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============7409088974261461941==--
