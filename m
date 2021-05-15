Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4568.1621074783566007917
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5DFB738C13B6
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hdparm: upgrading to 9.62 SUCCEEDED
Message-ID: <MADEUP.167F36ED75DD9932.8589@lists.openembedded.org>
X-Groupsio-MsgNum: 151809
Content-Type: multipart/mixed; boundary="===============1752120898693122725=="

--===============1752120898693122725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hdparm* to *9.62* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hdparm-upgrade-9.61-9.62.patch
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

--===============1752120898693122725==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-hdparm-upgrade-9.61-9.62.patch"

From 418d0b661fd0dc403701c472df7c3e676cd3a032 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 05:42:38 +0000
Subject: [PATCH] hdparm: upgrade 9.61 -> 9.62

---
 .../recipes-extended/hdparm/{hdparm_9.61.bb => hdparm_9.62.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.61.bb => hdparm_9.62.bb} (90%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.61.bb b/meta/recipes-extended/hdparm/hdparm_9.62.bb
similarity index 90%
rename from meta/recipes-extended/hdparm/hdparm_9.61.bb
rename to meta/recipes-extended/hdparm/hdparm_9.62.bb
index 459a62a833..026772351d 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.61.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.62.bb
@@ -25,8 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[md5sum] = "3ef06831e83890f0ba48f7a252b93325"
-SRC_URI[sha256sum] = "da1a1c3887f10b8397e8e02013caa61142e0e72cb0d73997421ca2f2f4df5343"
+SRC_URI[sha256sum] = "2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29d4c1038ed1be777f"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.27.0


--===============1752120898693122725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/hdparm/hdparm-dbg: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm/hdparm-dbg: PV changed from "9.61" to "9.62"
packages/core2-32-poky-linux/hdparm/hdparm-dbg: PKGSIZE changed from 303972 to 303796 (-0%)
packages/core2-32-poky-linux/hdparm/hdparm-dev: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm/hdparm-dev: PV changed from "9.61" to "9.62"
packages/core2-32-poky-linux/hdparm/hdparm-doc: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm/hdparm-doc: PV changed from "9.61" to "9.62"
packages/core2-32-poky-linux/hdparm/hdparm-doc: PKGSIZE changed from 37366 to 37364 (-0%)
packages/core2-32-poky-linux/hdparm/hdparm-locale: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm/hdparm-locale: PV changed from "9.61" to "9.62"
packages/core2-32-poky-linux/hdparm/hdparm-src: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm/hdparm-src: PV changed from "9.61" to "9.62"
packages/core2-32-poky-linux/hdparm/hdparm-src: PKGSIZE changed from 228817 to 228882 (+0%)
packages/core2-32-poky-linux/hdparm/hdparm-staticdev: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm/hdparm-staticdev: PV changed from "9.61" to "9.62"
packages/core2-32-poky-linux/hdparm/hdparm: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm/hdparm: PV changed from "9.61" to "9.62"
packages/core2-32-poky-linux/hdparm: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm: PV changed from "9.61" to "9.62"
packages/core2-32-poky-linux/hdparm: SRC_URI changed from "https://downloads.sourceforge.net/hdparm/hdparm-9.61.tar.gz file://wiper.sh-fix-stat-path.patch" to "https://downloads.sourceforge.net/hdparm/hdparm-9.62.tar.gz file://wiper.sh-fix-stat-path.patch"
packages/core2-32-poky-linux/hdparm/wiper: PKGV changed from 9.61 [default] to 9.62 [default]
packages/core2-32-poky-linux/hdparm/wiper: PV changed from "9.61" to "9.62"

--===============1752120898693122725==--
