Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12418.1602843682982633104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id F079938C1645
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:21 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libuv: upgrading to 1.40.0 SUCCEEDED
Message-ID: <MADEUP.163E71D66959759A.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143411
Content-Type: multipart/mixed; boundary="===============2207542397755077101=="

--===============2207542397755077101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libuv* to *1.40.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.39.0-1.40.0.patch
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

--===============2207542397755077101==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.39.0-1.40.0.patch"

From f57a25f438e871f19da1280bf3e8569d5128fff1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 00:00:07 +0000
Subject: [PATCH] libuv: upgrade 1.39.0 -> 1.40.0

---
 .../libuv/{libuv_1.39.0.bb => libuv_1.40.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.39.0.bb => libuv_1.40.0.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.39.0.bb b/meta/recipes-connectivity/libuv/libuv_1.40.0.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.39.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.40.0.bb
index b6ce4757fd..f793db09be 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.39.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.40.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "25f4b8b8a3c0f934158cd37a37b0525d75ca488e"
+SRCREV = "4e69e333252693bd82d6338d6124f0416538dbfc"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.18.4


--===============2207542397755077101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libuv: PKGV changed from 1.39.0 [default] to 1.40.0 [default]
packages/core2-32-poky-linux/libuv: PV changed from "1.39.0" to "1.40.0"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGV changed from 1.39.0 [default] to 1.40.0 [default]
packages/core2-32-poky-linux/libuv/libuv-dbg: PV changed from "1.39.0" to "1.40.0"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 606052 to 606680 (+0%)
packages/core2-32-poky-linux/libuv/libuv-dev: PKGV changed from 1.39.0 [default] to 1.40.0 [default]
packages/core2-32-poky-linux/libuv/libuv-dev: PV changed from "1.39.0" to "1.40.0"
packages/core2-32-poky-linux/libuv/libuv-dev: PKGSIZE changed from 100601 to 100980 (+0%)
packages/core2-32-poky-linux/libuv/libuv-doc: PKGV changed from 1.39.0 [default] to 1.40.0 [default]
packages/core2-32-poky-linux/libuv/libuv-doc: PV changed from "1.39.0" to "1.40.0"
packages/core2-32-poky-linux/libuv/libuv-locale: PKGV changed from 1.39.0 [default] to 1.40.0 [default]
packages/core2-32-poky-linux/libuv/libuv-locale: PV changed from "1.39.0" to "1.40.0"
packages/core2-32-poky-linux/libuv/libuv-src: PKGV changed from 1.39.0 [default] to 1.40.0 [default]
packages/core2-32-poky-linux/libuv/libuv-src: PV changed from "1.39.0" to "1.40.0"
packages/core2-32-poky-linux/libuv/libuv-src: PKGSIZE changed from 544799 to 546554 (+0%)
packages/core2-32-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.39.0 [default] to 1.40.0 [default]
packages/core2-32-poky-linux/libuv/libuv-staticdev: PV changed from "1.39.0" to "1.40.0"
packages/core2-32-poky-linux/libuv/libuv: PKGV changed from 1.39.0 [default] to 1.40.0 [default]
packages/core2-32-poky-linux/libuv/libuv: PV changed from "1.39.0" to "1.40.0"

--===============2207542397755077101==--
