Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.1362.1618510600061197652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id F1F6238C140C
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.2.1 SUCCEEDED
Message-ID: <MADEUP.16761AD139219396.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150546
Content-Type: multipart/mixed; boundary="===============4455522682028277445=="

--===============4455522682028277445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libhandy-upgrade-1.2.0-1.2.1.patch
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

--===============4455522682028277445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libhandy: PACKAGES: added "libhandy-locale-nl"
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PKGSIZE changed from 3481 to 13210 (+279%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PKGSIZE changed from 16724 to 24407 (+46%)

--===============4455522682028277445==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libhandy-upgrade-1.2.0-1.2.1.patch"

From b921c9b55f2ab14aa9a8c6f6ba37ca1086749bdd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 12:19:48 +0000
Subject: [PATCH] libhandy: upgrade 1.2.0 -> 1.2.1

---
 .../libhandy/{libhandy_1.2.0.bb => libhandy_1.2.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.2.0.bb => libhandy_1.2.1.bb} (95%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.2.1.bb
similarity index 95%
rename from meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.2.1.bb
index 1e37feb20a..68c8e01940 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.2.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.2.1.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https"
-SRCREV = "7b38a860ffcec6c2ad28153358cc3d037ddb618f"
+SRCREV = "e6e5b4f747d43f10ad2af18060bf1c1d034c9c1a"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.27.0


--===============4455522682028277445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libhandy: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy: PACKAGES: added "libhandy-locale-nl"
packages/core2-32-poky-linux/libhandy: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGSIZE changed from 2378780 to 2380452 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-dev: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGSIZE changed from 791016 to 791126 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-doc: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-doc: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-examples: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGSIZE changed from 276520 to 280616 (+1%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-ca: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ca: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-de: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-de: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PKGSIZE changed from 3481 to 13210 (+279%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PKGSIZE changed from 16724 to 24407 (+46%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sr: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sr: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sv: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sv: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-src: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGSIZE changed from 4709400 to 4713006 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PKGV changed from 1.2.0 [default] to 1.2.1 [default]
packages/core2-32-poky-linux/libhandy/libhandy: PV changed from "1.2.0" to "1.2.1"
packages/core2-32-poky-linux/libhandy/libhandy: PKGV changed from 1.2.0 [default] to 1.2.1 [default]

--===============4455522682028277445==--
