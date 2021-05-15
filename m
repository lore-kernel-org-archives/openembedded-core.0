Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4567.1621074783434697778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id CC5B138C1400
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxkbcommon: upgrading to 1.3.0 SUCCEEDED
Message-ID: <MADEUP.167F36EDD366672A.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151838
Content-Type: multipart/mixed; boundary="===============1461768801215146623=="

--===============1461768801215146623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxkbcommon* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.2.1-1.3.0.patch
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

--===============1461768801215146623==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.2.1-1.3.0.patch"

From 1a5fbb0758f7f38b740f3e19c576dce6ba7453e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 08:00:55 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.2.1 -> 1.3.0

---
 .../xorg-lib/{libxkbcommon_1.2.1.bb => libxkbcommon_1.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.2.1.bb => libxkbcommon_1.3.0.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb
index 3df90f7c3e..26bbaadcb5 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e833a7d3024c9bb9d5eb2b20f6d5de08865541f21bb7ba227c83cbd236691fb3"
+SRC_URI[sha256sum] = "7b09e098ea69bc3054f0c57a9a25fda571c4df22398811606e32b5fffeb75e7b"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.27.0


--===============1461768801215146623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxkbcommon: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libxkbcommon: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/libxkbcommon: SRC_URI changed from "http://xkbcommon.org/download/libxkbcommon-1.2.1.tar.xz" to "http://xkbcommon.org/download/libxkbcommon-1.3.0.tar.xz"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 837300 to 841164 (+0%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 1391992 to 1392544 (+0%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.2.1" to "1.3.0"

--===============1461768801215146623==--
