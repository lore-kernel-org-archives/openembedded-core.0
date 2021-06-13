Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.16438.1623585061649045194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8E9BF38C140C
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libx11: upgrading to 1.7.2 SUCCEEDED
Message-ID: <MADEUP.168822030516FDBC.15968@lists.openembedded.org>
X-Groupsio-MsgNum: 152906
Content-Type: multipart/mixed; boundary="===============8691784137512133586=="

--===============8691784137512133586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libx11* to *1.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libx11-upgrade-1.7.1-1.7.2.patch
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

--===============8691784137512133586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libx11: SRC_URI changed from "https://www.x.org/releases//individual/lib/libX11-1.7.1.tar.bz2 file://Fix-hanging-issue-in-_XReply.patch file://disable_tests.patch" to "https://www.x.org/releases//individual/lib/libX11-1.7.2.tar.bz2 file://Fix-hanging-issue-in-_XReply.patch file://disable_tests.patch"
packages/core2-32-poky-linux/libx11: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGSIZE changed from 10919128 to 10919916 (+0%)
packages/core2-32-poky-linux/libx11/libx11-dbg: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11/libx11-dbg: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-32-poky-linux/libx11/libx11-dev: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11/libx11-dev: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-32-poky-linux/libx11/libx11-doc: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11/libx11-doc: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-32-poky-linux/libx11/libx11-locale: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11/libx11-locale: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-32-poky-linux/libx11/libx11-src: PKGSIZE changed from 5421577 to 5421704 (+0%)
packages/core2-32-poky-linux/libx11/libx11-src: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11/libx11-src: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-32-poky-linux/libx11/libx11-staticdev: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11/libx11-staticdev: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-32-poky-linux/libx11/libx11-xcb: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11/libx11-xcb: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-32-poky-linux/libx11/libx11: PV changed from "1.7.1" to "1.7.2"
packages/core2-32-poky-linux/libx11/libx11: PKGV changed from 1.7.1 [default] to 1.7.2 [default]

--===============8691784137512133586==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libx11-upgrade-1.7.1-1.7.2.patch"

From 1e6c1426aa4f7b935bf5eeaa26f3da2c9b70b76b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 10:34:33 +0000
Subject: [PATCH] libx11: upgrade 1.7.1 -> 1.7.2

---
 .../xorg-lib/{libx11_1.7.1.bb => libx11_1.7.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.1.bb => libx11_1.7.2.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
index b5f0445e12..383860409f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
            file://disable_tests.patch \
            "
 
-SRC_URI[sha256sum] = "e64e43deaa562cbfb0d5ada64670ec09c6fac7935262dcd77bbc6d984a535d47"
+SRC_URI[sha256sum] = "1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d6f90d13c3092ea6c"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.17.1


--===============8691784137512133586==--
