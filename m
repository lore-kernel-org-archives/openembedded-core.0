Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.13273.1626600382440807613
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 973D838C1382
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Adrian Bunk <bunk@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2021.07.14 SUCCEEDED
Message-ID: <MADEUP.1692D86E0B8E650C.12794@lists.openembedded.org>
X-Groupsio-MsgNum: 153972
Content-Type: multipart/mixed; boundary="===============7163748874924022823=="

--===============7163748874924022823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2021.07.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2021.04.21-2021.07.14.patch
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

--===============7163748874924022823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PKGV changed from 2021.04.21 [default] to 2021.07.14 [default]
packages/all-poky-linux/wireless-regdb: PV changed from "2021.04.21" to "2021.07.14"
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2021.04.21.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2021.07.14.tar.xz"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2021.04.21 [default] to 2021.07.14 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2021.04.21" to "2021.07.14"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2021.04.21 [default] to 2021.07.14 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2021.04.21" to "2021.07.14"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5198 to 5218 (+0%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2021.04.21 [default] to 2021.07.14 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2021.04.21" to "2021.07.14"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 6039 to 6067 (+0%)

--===============7163748874924022823==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2021.04.21-2021.07.14.patch"

From 25b5e2dcc10cdb31c4e2cfb6b92e5aa611eab0c0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 18 Jul 2021 08:37:40 +0000
Subject: [PATCH] wireless-regdb: upgrade 2021.04.21 -> 2021.07.14

---
 ...ireless-regdb_2021.04.21.bb => wireless-regdb_2021.07.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.04.21.bb => wireless-regdb_2021.07.14.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
index f79c0b29ea..40b4d563f0 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9e4c02b2a9710df4dbdb327c39612e8cbbae6495987afeddaebab28c1ea3d8fa"
+SRC_URI[sha256sum] = "2e2dd216a5f1a310b849774af63e6309d94c2207c34771a534c47ae18b162742"
 
 inherit bin_package allarch
 
-- 
2.27.0


--===============7163748874924022823==--
