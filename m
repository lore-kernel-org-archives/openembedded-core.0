Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1329.1618510599840320599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9323438C124A
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] netbase: upgrading to 6.3 SUCCEEDED
Message-ID: <MADEUP.16761AD0C0E1F981.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150492
Content-Type: multipart/mixed; boundary="===============4074062749391771712=="

--===============4074062749391771712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *netbase* to *6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-netbase-upgrade-6.2-6.3.patch
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

--===============4074062749391771712==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-netbase-upgrade-6.2-6.3.patch"

From 023ec72411d40604e0a07873ebc55bade53baa22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 03:15:12 +0000
Subject: [PATCH] netbase: upgrade 6.2 -> 6.3

---
 meta/recipes-core/netbase/{netbase_6.2.bb => netbase_6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/netbase/{netbase_6.2.bb => netbase_6.3.bb} (89%)

diff --git a/meta/recipes-core/netbase/netbase_6.2.bb b/meta/recipes-core/netbase/netbase_6.3.bb
similarity index 89%
rename from meta/recipes-core/netbase/netbase_6.2.bb
rename to meta/recipes-core/netbase/netbase_6.3.bb
index a54d2e7764..0a7a9d71ed 100644
--- a/meta/recipes-core/netbase/netbase_6.2.bb
+++ b/meta/recipes-core/netbase/netbase_6.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
 inherit allarch
 
-SRC_URI[sha256sum] = "309a24146a06347d654b261e9e07a82fab844b173674a42e223803dd8258541e"
+SRC_URI[sha256sum] = "7c42a6a1cafa0c64103c71cab6431fc8613179b2449a1a00e55e3584e860d81c"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 
-- 
2.27.0


--===============4074062749391771712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/netbase: PKGV changed from 6.2 [default] to 6.3 [default]
packages/all-poky-linux/netbase: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/n/netbase/netbase_6.2.tar.xz" to "http://ftp.debian.org/debian/pool/main/n/netbase/netbase_6.3.tar.xz"
packages/all-poky-linux/netbase: PV changed from "6.2" to "6.3"
packages/all-poky-linux/netbase/netbase-dbg: PKGV changed from 6.2 [default] to 6.3 [default]
packages/all-poky-linux/netbase/netbase-dbg: PV changed from "6.2" to "6.3"
packages/all-poky-linux/netbase/netbase-dev: PKGV changed from 6.2 [default] to 6.3 [default]
packages/all-poky-linux/netbase/netbase-dev: PV changed from "6.2" to "6.3"
packages/all-poky-linux/netbase/netbase-doc: PKGV changed from 6.2 [default] to 6.3 [default]
packages/all-poky-linux/netbase/netbase-doc: PV changed from "6.2" to "6.3"
packages/all-poky-linux/netbase/netbase-locale: PKGV changed from 6.2 [default] to 6.3 [default]
packages/all-poky-linux/netbase/netbase-locale: PV changed from "6.2" to "6.3"
packages/all-poky-linux/netbase/netbase-src: PKGV changed from 6.2 [default] to 6.3 [default]
packages/all-poky-linux/netbase/netbase-src: PV changed from "6.2" to "6.3"
packages/all-poky-linux/netbase/netbase-staticdev: PKGV changed from 6.2 [default] to 6.3 [default]
packages/all-poky-linux/netbase/netbase-staticdev: PV changed from "6.2" to "6.3"
packages/all-poky-linux/netbase/netbase: PKGV changed from 6.2 [default] to 6.3 [default]
packages/all-poky-linux/netbase/netbase: PKGSIZE changed from 18601 to 18448 (-1%)
packages/all-poky-linux/netbase/netbase: PV changed from "6.2" to "6.3"

--===============4074062749391771712==--
