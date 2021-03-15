Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.326.1615826520838136003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id C1A6D38C137A
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxkbcommon: upgrading to 1.1.0 SUCCEEDED
Message-ID: <MADEUP.166C91A943B97EDA.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149521
Content-Type: multipart/mixed; boundary="===============1899235952565051917=="

--===============1899235952565051917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxkbcommon* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.0.3-1.1.0.patch
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

--===============1899235952565051917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxkbcommon: SRC_URI changed from "http://xkbcommon.org/download/libxkbcommon-1.0.3.tar.xz" to "http://xkbcommon.org/download/libxkbcommon-1.1.0.tar.xz"
packages/core2-32-poky-linux/libxkbcommon: PV changed from "1.0.3" to "1.1.0"
packages/core2-32-poky-linux/libxkbcommon: PKGV changed from 1.0.3 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.0.3" to "1.1.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.0.3 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 311263 to 330460 (+6%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.0.3" to "1.1.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.0.3 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.0.3" to "1.1.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.0.3 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.0.3" to "1.1.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.0.3 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 1348341 to 1365371 (+1%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.0.3" to "1.1.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.0.3 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.0.3" to "1.1.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.0.3 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGSIZE changed from 430010 to 434106 (+1%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.0.3" to "1.1.0"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.0.3 [default] to 1.1.0 [default]

--===============1899235952565051917==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.0.3-1.1.0.patch"

From 9a264549a1e5774a9e45076643f7f203b35a35f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 13:28:50 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.0.3 -> 1.1.0

---
 .../xorg-lib/{libxkbcommon_1.0.3.bb => libxkbcommon_1.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.0.3.bb => libxkbcommon_1.1.0.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.1.0.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.1.0.bb
index 99f55f4a14..a1dbda0e06 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.1.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a2202f851e072b84e64a395212cbd976ee18a8ee602008b0bad02a13247dbc52"
+SRC_URI[sha256sum] = "412cfcca596f92914ea1a66ad244804d73a5ff20b6d86459951e7ad20576c246"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.17.1


--===============1899235952565051917==--
