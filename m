Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.39496.1605551304217659016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5BA8838C13B7
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.0.2 SUCCEEDED
Message-ID: <MADEUP.16481067A87039DB.12355@lists.openembedded.org>
X-Groupsio-MsgNum: 144655
Content-Type: multipart/mixed; boundary="===============0483183546944117386=="

--===============0483183546944117386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libhandy-upgrade-1.0.1-1.0.2.patch
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

--===============0483183546944117386==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libhandy-upgrade-1.0.1-1.0.2.patch"

From a653ed2f7702c56d6cd53a1e9454b31cff774034 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 15:35:45 +0000
Subject: [PATCH] libhandy: upgrade 1.0.1 -> 1.0.2

---
 .../libhandy/{libhandy_1.0.1.bb => libhandy_1.0.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.0.1.bb => libhandy_1.0.2.bb} (91%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
similarity index 91%
rename from meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
index 146ef62f41..4daa3c1a54 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
-SRCREV = "5cee0927b8b39dea1b2a62ec6d19169f73ba06c6"
+SRCREV = "465c00f8f80c27330be494ed7c0ba2ffe26321c4"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.20.1


--===============0483183546944117386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libhandy: PACKAGES: added "libhandy-locale-ca"

--===============0483183546944117386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libhandy: PACKAGES: added "libhandy-locale-ca"
packages/core2-32-poky-linux/libhandy: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGSIZE changed from 1684896 to 1685748 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGSIZE changed from 562991 to 562994 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-dev: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-doc: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-doc: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-examples: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGSIZE changed from 4147854 to 4148572 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-src: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PV changed from "1.0.1" to "1.0.2"
packages/core2-32-poky-linux/libhandy/libhandy: PKGV changed from 1.0.1 [default] to 1.0.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy: PV changed from "1.0.1" to "1.0.2"

--===============0483183546944117386==--
