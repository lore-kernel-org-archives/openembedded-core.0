Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1292.1618510600131742405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 01C5F38C1419
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libportal: upgrading to 0.4 SUCCEEDED
Message-ID: <MADEUP.16761AD13F322573.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150548
Content-Type: multipart/mixed; boundary="===============6927684573131316415=="

--===============6927684573131316415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libportal* to *0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libportal-upgrade-0.3-0.4.patch
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

--===============6927684573131316415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/libportal (sysroot):
  /usr/include/libportal/portal-qt5.h was added

--===============6927684573131316415==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libportal-upgrade-0.3-0.4.patch"

From 3ff0e0e4365b9e8e4bf1af1ef3599810d6917ad5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 12:22:53 +0000
Subject: [PATCH] libportal: upgrade 0.3 -> 0.4

---
 .../libportal/{libportal_0.3.bb => libportal_0.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.3.bb => libportal_0.4.bb} (92%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.3.bb b/meta/recipes-gnome/libportal/libportal_0.4.bb
similarity index 92%
rename from meta/recipes-gnome/libportal/libportal_0.3.bb
rename to meta/recipes-gnome/libportal/libportal_0.4.bb
index bc4ff3784c..03e681f58c 100644
--- a/meta/recipes-gnome/libportal/libportal_0.3.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.4.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https"
-SRCREV = "a609e06d0c4adc5c510cf9ac7b060db3d368e78f"
+SRCREV = "f68764e288ede516d902b131cc4fadded3804059"
 S = "${WORKDIR}/git"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
-- 
2.27.0


--===============6927684573131316415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libportal: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/libportal: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/libportal/libportal-dbg: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/libportal/libportal-dbg: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/libportal/libportal-dbg: PKGSIZE changed from 273916 to 275252 (+0%)
packages/core2-32-poky-linux/libportal/libportal-dev: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/libportal/libportal-dev: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/libportal/libportal-dev: PKGSIZE changed from 62735 to 64916 (+3%)
packages/core2-32-poky-linux/libportal/libportal-doc: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/libportal/libportal-doc: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/libportal/libportal-locale: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/libportal/libportal-locale: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/libportal/libportal-src: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/libportal/libportal-src: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/libportal/libportal-src: PKGSIZE changed from 317031 to 316801 (-0%)
packages/core2-32-poky-linux/libportal/libportal-staticdev: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/libportal/libportal-staticdev: PKGV changed from 0.3 [default] to 0.4 [default]
packages/core2-32-poky-linux/libportal/libportal: PV changed from "0.3" to "0.4"
packages/core2-32-poky-linux/libportal/libportal: PKGV changed from 0.3 [default] to 0.4 [default]
Changes to packages/core2-32-poky-linux/libportal (sysroot):
  /usr/include/libportal/portal-qt5.h was added

--===============6927684573131316415==--
