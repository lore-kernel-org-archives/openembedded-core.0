Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4463.1621074783402865640
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 55A7838C13AA
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.52.3 SUCCEEDED
Message-ID: <MADEUP.167F36ED63DB8477.8202@lists.openembedded.org>
X-Groupsio-MsgNum: 151802
Content-Type: multipart/mixed; boundary="===============4333834088044793465=="

--===============4333834088044793465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.52.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.52.2-0.52.3.patch
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

--===============4333834088044793465==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.52.2-0.52.3.patch"

From 9d942fdbed9d28b882d0202266460cd60f9da6b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 05:36:30 +0000
Subject: [PATCH] vala: upgrade 0.52.2 -> 0.52.3

---
 meta/recipes-devtools/vala/{vala_0.52.2.bb => vala_0.52.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.52.2.bb => vala_0.52.3.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.52.2.bb b/meta/recipes-devtools/vala/vala_0.52.3.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.52.2.bb
rename to meta/recipes-devtools/vala/vala_0.52.3.bb
index b860962322..133dc9efad 100644
--- a/meta/recipes-devtools/vala/vala_0.52.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.52.3.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "3a3c460803ba661e513be3d0984b583e05473f602c75fa98e91755503714a97b"
+SRC_URI[sha256sum] = "037ea1a92bf0f1ab04a71b52a01d50aca1945ad1017b6189d9614f84f5c9b2d9"
-- 
2.27.0


--===============4333834088044793465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PKGV changed from 0.52.2 [default] to 0.52.3 [default]
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.52/vala-0.52.2.tar.xz file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.52/vala-0.52.3.tar.xz file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
packages/core2-32-poky-linux/vala: PV changed from "0.52.2" to "0.52.3"
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 15636144 to 15644164 (+0%)
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.52.2 [default] to 0.52.3 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.52.2" to "0.52.3"
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.52.2 [default] to 0.52.3 [default]
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.52.2" to "0.52.3"
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 9699 to 9693 (-0%)
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.52.2 [default] to 0.52.3 [default]
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.52.2" to "0.52.3"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.52.2 [default] to 0.52.3 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.52.2" to "0.52.3"
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15123326 to 15132479 (+0%)
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.52.2 [default] to 0.52.3 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.52.2" to "0.52.3"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.52.2 [default] to 0.52.3 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.52.2" to "0.52.3"
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 12395373 to 12399469 (+0%)
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.52.2 [default] to 0.52.3 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.52.2" to "0.52.3"

--===============4333834088044793465==--
