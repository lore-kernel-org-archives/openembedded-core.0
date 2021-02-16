Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5210.1613463848323720586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 218BC38C08BC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:07 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libuv: upgrading to 1.41.0 SUCCEEDED
Message-ID: <MADEUP.16642CD258CCE183.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148092
Content-Type: multipart/mixed; boundary="===============7935899611788896904=="

--===============7935899611788896904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libuv* to *1.41.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.40.0-1.41.0.patch
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

--===============7935899611788896904==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.40.0-1.41.0.patch"

From 354c74be880cf689d5884aa5b3921af1b02a19b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 16:58:09 +0000
Subject: [PATCH] libuv: upgrade 1.40.0 -> 1.41.0

---
 .../libuv/{libuv_1.40.0.bb => libuv_1.41.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.40.0.bb => libuv_1.41.0.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.40.0.bb b/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.40.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.41.0.bb
index f793db09be..ab06a43d21 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.40.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.41.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "4e69e333252693bd82d6338d6124f0416538dbfc"
+SRCREV = "1dff88e5161cba5c59276d2070d2e304e4dcb242"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


--===============7935899611788896904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libuv: PKGV changed from 1.40.0 [default] to 1.41.0 [default]
packages/core2-32-poky-linux/libuv: PV changed from "1.40.0" to "1.41.0"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 604640 to 609860 (+1%)
packages/core2-32-poky-linux/libuv/libuv-dbg: PV changed from "1.40.0" to "1.41.0"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGV changed from 1.40.0 [default] to 1.41.0 [default]
packages/core2-32-poky-linux/libuv/libuv-dev: PKGSIZE changed from 100980 to 101506 (+1%)
packages/core2-32-poky-linux/libuv/libuv-dev: PV changed from "1.40.0" to "1.41.0"
packages/core2-32-poky-linux/libuv/libuv-dev: PKGV changed from 1.40.0 [default] to 1.41.0 [default]
packages/core2-32-poky-linux/libuv/libuv-doc: PV changed from "1.40.0" to "1.41.0"
packages/core2-32-poky-linux/libuv/libuv-doc: PKGV changed from 1.40.0 [default] to 1.41.0 [default]
packages/core2-32-poky-linux/libuv/libuv-locale: PV changed from "1.40.0" to "1.41.0"
packages/core2-32-poky-linux/libuv/libuv-locale: PKGV changed from 1.40.0 [default] to 1.41.0 [default]
packages/core2-32-poky-linux/libuv/libuv-src: PKGSIZE changed from 546554 to 549695 (+1%)
packages/core2-32-poky-linux/libuv/libuv-src: PV changed from "1.40.0" to "1.41.0"
packages/core2-32-poky-linux/libuv/libuv-src: PKGV changed from 1.40.0 [default] to 1.41.0 [default]
packages/core2-32-poky-linux/libuv/libuv-staticdev: PV changed from "1.40.0" to "1.41.0"
packages/core2-32-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.40.0 [default] to 1.41.0 [default]
packages/core2-32-poky-linux/libuv/libuv: PV changed from "1.40.0" to "1.41.0"
packages/core2-32-poky-linux/libuv/libuv: PKGV changed from 1.40.0 [default] to 1.41.0 [default]

--===============7935899611788896904==--
