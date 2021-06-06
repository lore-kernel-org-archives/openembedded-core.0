Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.25799.1623000257921543294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 31D9D38C1286
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.52.4 SUCCEEDED
Message-ID: <MADEUP.16860E22BAF53EFE.22991@lists.openembedded.org>
X-Groupsio-MsgNum: 152714
Content-Type: multipart/mixed; boundary="===============1904638542349610713=="

--===============1904638542349610713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.52.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.52.3-0.52.4.patch
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

--===============1904638542349610713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PKGV changed from 0.52.3 [default] to 0.52.4 [default]
packages/core2-32-poky-linux/vala: PV changed from "0.52.3" to "0.52.4"
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.52/vala-0.52.3.tar.xz file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.52/vala-0.52.4.tar.xz file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.52.3 [default] to 0.52.4 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.52.3" to "0.52.4"
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 15644368 to 15645380 (+0%)
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.52.3 [default] to 0.52.4 [default]
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.52.3" to "0.52.4"
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.52.3 [default] to 0.52.4 [default]
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.52.3" to "0.52.4"
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 9693 to 10304 (+6%)
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.52.3 [default] to 0.52.4 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.52.3" to "0.52.4"
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.52.3 [default] to 0.52.4 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.52.3" to "0.52.4"
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15132479 to 15134169 (+0%)
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.52.3 [default] to 0.52.4 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.52.3" to "0.52.4"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.52.3 [default] to 0.52.4 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.52.3" to "0.52.4"
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 12399469 to 12400013 (+0%)

--===============1904638542349610713==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.52.3-0.52.4.patch"

From e4986427ffd4f84376bc279eff705bb909e1553b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 09:52:56 +0000
Subject: [PATCH] vala: upgrade 0.52.3 -> 0.52.4

---
 meta/recipes-devtools/vala/{vala_0.52.3.bb => vala_0.52.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.52.3.bb => vala_0.52.4.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.52.3.bb b/meta/recipes-devtools/vala/vala_0.52.4.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.52.3.bb
rename to meta/recipes-devtools/vala/vala_0.52.4.bb
index 133dc9efad..8e2869d408 100644
--- a/meta/recipes-devtools/vala/vala_0.52.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.52.4.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "037ea1a92bf0f1ab04a71b52a01d50aca1945ad1017b6189d9614f84f5c9b2d9"
+SRC_URI[sha256sum] = "ecde520e5160e659ee699f8b1cdc96065edbd44bbd08eb48ef5f2506751fdf31"
-- 
2.17.1


--===============1904638542349610713==--
