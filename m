Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.39491.1605551303698542795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8CF6138C13D2
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xkbcomp: upgrading to 1.4.4 SUCCEEDED
Message-ID: <MADEUP.16481067BC093CDA.12355@lists.openembedded.org>
X-Groupsio-MsgNum: 144662
Content-Type: multipart/mixed; boundary="===============8837290428166589407=="

--===============8837290428166589407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xkbcomp* to *1.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkbcomp-upgrade-1.4.3-1.4.4.patch
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

--===============8837290428166589407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xkbcomp: PV changed from "1.4.3" to "1.4.4"
packages/core2-32-poky-linux/xkbcomp: SRC_URI changed from "https://www.x.org/releases//individual/app/xkbcomp-1.4.3.tar.bz2" to "https://www.x.org/releases//individual/app/xkbcomp-1.4.4.tar.bz2"
packages/core2-32-poky-linux/xkbcomp: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dbg: PV changed from "1.4.3" to "1.4.4"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dbg: PKGSIZE changed from 517220 to 521312 (+1%)
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dbg: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dev: PV changed from "1.4.3" to "1.4.4"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-dev: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-doc: PV changed from "1.4.3" to "1.4.4"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-doc: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-locale: PV changed from "1.4.3" to "1.4.4"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-locale: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-src: PV changed from "1.4.3" to "1.4.4"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-src: PKGSIZE changed from 580379 to 580484 (+0%)
packages/core2-32-poky-linux/xkbcomp/xkbcomp-src: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp-staticdev: PV changed from "1.4.3" to "1.4.4"
packages/core2-32-poky-linux/xkbcomp/xkbcomp-staticdev: PKGV changed from 1.4.3 [default] to 1.4.4 [default]
packages/core2-32-poky-linux/xkbcomp/xkbcomp: PV changed from "1.4.3" to "1.4.4"
packages/core2-32-poky-linux/xkbcomp/xkbcomp: PKGV changed from 1.4.3 [default] to 1.4.4 [default]

--===============8837290428166589407==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xkbcomp-upgrade-1.4.3-1.4.4.patch"

From 9ba195e6685e012ba061bd37e668f809a8a1e479 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 17:14:57 +0000
Subject: [PATCH] xkbcomp: upgrade 1.4.3 -> 1.4.4

---
 .../xorg-app/{xkbcomp_1.4.3.bb => xkbcomp_1.4.4.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.3.bb => xkbcomp_1.4.4.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
index 2fa79c8438..44143a04ca 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.4.bb
@@ -15,5 +15,4 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += "--disable-selective-werror"
 
-SRC_URI[md5sum] = "6e4751d99373f85d459ab4dff28893f5"
-SRC_URI[sha256sum] = "06242c169fc11caf601cac46d781d467748c6a330e15b36dce46520b8ac8d435"
+SRC_URI[sha256sum] = "59cce603a607a17722a0a1cf99010f4894e7812beb5d695abbc08474d59af27e"
-- 
2.20.1


--===============8837290428166589407==--
