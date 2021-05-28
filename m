Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.6796.1622200975829994425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2966338C12BB
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.22 SUCCEEDED
Message-ID: <MADEUP.168337315F114FBB.665@lists.openembedded.org>
X-Groupsio-MsgNum: 152340
Content-Type: multipart/mixed; boundary="===============7715600912961347179=="

--===============7715600912961347179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.20-4.4.22.patch
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

--===============7715600912961347179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.20" to "4.4.22"
packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.20 [default] to 4.4.22 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.20" to "4.4.22"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.20 [default] to 4.4.22 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 523564 to 523672 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.20" to "4.4.22"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.20 [default] to 4.4.22 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.20" to "4.4.22"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.20 [default] to 4.4.22 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.20" to "4.4.22"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.20 [default] to 4.4.22 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.20" to "4.4.22"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.20 [default] to 4.4.22 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 749612 to 749900 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.20" to "4.4.22"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.20 [default] to 4.4.22 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.20" to "4.4.22"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.20 [default] to 4.4.22 [default]

--===============7715600912961347179==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.20-4.4.22.patch"

From 8fea3ac253d70e84f8c6b02e8aec7ba5ab92d882 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 08:04:39 +0000
Subject: [PATCH] libxcrypt-compat: upgrade 4.4.20 -> 4.4.22

---
 .../{libxcrypt-compat_4.4.20.bb => libxcrypt-compat_4.4.22.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.20.bb => libxcrypt-compat_4.4.22.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.22.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.20.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.22.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index c16068c161..e4505a666d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "e73ff0137de5152e69e8abb0bd260541804dfe5a"
+SRCREV = "3df9620d08db207367c0c5152148665b5ce422e1"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
-- 
2.27.0


--===============7715600912961347179==--
