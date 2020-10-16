Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12419.1602843683121280001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2BF9338C1692
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] netbase: upgrading to 6.2 SUCCEEDED
Message-ID: <MADEUP.163E71D6724E1C6F.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143415
Content-Type: multipart/mixed; boundary="===============2174120151827878382=="

--===============2174120151827878382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *netbase* to *6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-netbase-upgrade-6.1-6.2.patch
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

--===============2174120151827878382==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-netbase-upgrade-6.1-6.2.patch"

From c57c9265d0a36ead7d25593f9be67d48dbcf23f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 01:42:53 +0000
Subject: [PATCH] netbase: upgrade 6.1 -> 6.2

---
 meta/recipes-core/netbase/{netbase_6.1.bb => netbase_6.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/netbase/{netbase_6.1.bb => netbase_6.2.bb} (82%)

diff --git a/meta/recipes-core/netbase/netbase_6.1.bb b/meta/recipes-core/netbase/netbase_6.2.bb
similarity index 82%
rename from meta/recipes-core/netbase/netbase_6.1.bb
rename to meta/recipes-core/netbase/netbase_6.2.bb
index bc0049c020..4a82b9465e 100644
--- a/meta/recipes-core/netbase/netbase_6.1.bb
+++ b/meta/recipes-core/netbase/netbase_6.2.bb
@@ -8,8 +8,7 @@ PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
-SRC_URI[md5sum] = "e5871a3a5c8390557b8033cf19316a55"
-SRC_URI[sha256sum] = "084d743bd84d4d9380bac4c71c51e57406dce44f5a69289bb823c903e9b035d8"
+SRC_URI[sha256sum] = "309a24146a06347d654b261e9e07a82fab844b173674a42e223803dd8258541e"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
-- 
2.18.4


--===============2174120151827878382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/netbase: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/netbase: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/netbase/netbase-dbg: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/netbase/netbase-dbg: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/netbase/netbase-dev: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/netbase/netbase-dev: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/netbase/netbase-doc: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/netbase/netbase-doc: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/netbase/netbase-locale: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/netbase/netbase-locale: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/netbase/netbase-src: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/netbase/netbase-src: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/netbase/netbase-staticdev: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/netbase/netbase-staticdev: PKGV changed from 6.1 [default] to 6.2 [default]
packages/core2-32-poky-linux/netbase/netbase: PV changed from "6.1" to "6.2"
packages/core2-32-poky-linux/netbase/netbase: PKGSIZE changed from 18283 to 16785 (-8%)
packages/core2-32-poky-linux/netbase/netbase: PKGV changed from 6.1 [default] to 6.2 [default]

--===============2174120151827878382==--
