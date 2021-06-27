Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.5775.1624805202740004861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id 09DB338C12B7
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:42 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xf86-input-libinput: upgrading to 1.1.0 SUCCEEDED
Message-ID: <MADEUP.168C77B932797096.17375@lists.openembedded.org>
X-Groupsio-MsgNum: 153310
Content-Type: multipart/mixed; boundary="===============6664078840559462396=="

--===============6664078840559462396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xf86-input-libinput* to *1.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xf86-input-libinput-upgrade-1.0.1-1.1.0.patch
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

--===============6664078840559462396==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xf86-input-libinput-upgrade-1.0.1-1.1.0.patch"

From 310a19fa5c2104e8fd0c7c6f6d8ae847c373bbed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 13:39:41 +0000
Subject: [PATCH] xf86-input-libinput: upgrade 1.0.1 -> 1.1.0

---
 ...f86-input-libinput_1.0.1.bb => xf86-input-libinput_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_1.0.1.bb => xf86-input-libinput_1.1.0.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb
index 1777492ed9..5688eb4767 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 
 DEPENDS += "libinput"
 
-SRC_URI[sha256sum] = "fddec49c115591918475155bf16aaf23017d7f814cee7823a0c11f867aca245b"
+SRC_URI[sha256sum] = "e11d2a41419124a6e9b148f1df181bf7819fc7398c8ee9a1b6390b0742c68d16"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.17.1


--===============6664078840559462396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xf86-input-libinput: PV changed from "1.0.1" to "1.1.0"
packages/core2-32-poky-linux/xf86-input-libinput: SRC_URI changed from "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.0.1.tar.bz2" to "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.1.0.tar.bz2"
packages/core2-32-poky-linux/xf86-input-libinput: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGSIZE changed from 207664 to 210044 (+1%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PV changed from "1.0.1" to "1.1.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGSIZE changed from 9418 to 9734 (+3%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PV changed from "1.0.1" to "1.1.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGSIZE changed from 16358 to 17495 (+7%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PV changed from "1.0.1" to "1.1.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PV changed from "1.0.1" to "1.1.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGSIZE changed from 171253 to 174514 (+2%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PV changed from "1.0.1" to "1.1.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PV changed from "1.0.1" to "1.1.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PKGV changed from 1.0.1 [default] to 1.1.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGSIZE changed from 85905 to 90001 (+5%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PV changed from "1.0.1" to "1.1.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGV changed from 1.0.1 [default] to 1.1.0 [default]

--===============6664078840559462396==--
