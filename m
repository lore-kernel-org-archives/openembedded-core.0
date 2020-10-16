Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12422.1602843683509209864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id EF7CD38C16A3
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.15 SUCCEEDED
Message-ID: <MADEUP.163E71D6E204E32F.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143463
Content-Type: multipart/mixed; boundary="===============6813241826807236346=="

--===============6813241826807236346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsolv* to *0.7.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.14-0.7.15.patch
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

--===============6813241826807236346==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.14-0.7.15.patch"

From 973d8004bfb6fdb832d01f1f339ca67075fdc7fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 06:09:26 +0000
Subject: [PATCH] libsolv: upgrade 0.7.14 -> 0.7.15

---
 .../libsolv/{libsolv_0.7.14.bb => libsolv_0.7.15.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.14.bb => libsolv_0.7.15.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.14.bb b/meta/recipes-extended/libsolv/libsolv_0.7.15.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.7.14.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.15.bb
index 5179d4565a..1037cadcb3 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.14.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.15.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "b264537ea43ce39d93d8d97fcca16e97825beaa0"
+SRCREV = "1b6c40ba54a7790cef7f6b1801eda2585f62172b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.18.4


--===============6813241826807236346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsolv: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2642532 to 2643132 (+0%)
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 124545 to 124682 (+0%)
packages/core2-32-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolv-src: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1558964 to 1561053 (+0%)
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolv: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolv: PV changed from "0.7.14" to "0.7.15"
packages/core2-32-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.14 [default] to 0.7.15 [default]
packages/core2-32-poky-linux/libsolv/libsolvext: PV changed from "0.7.14" to "0.7.15"

--===============6813241826807236346==--
