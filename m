Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12523.1602843683226428071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id A7A8038C17D2
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.38.0 SUCCEEDED
Message-ID: <MADEUP.163E71D74B6048DA.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143498
Content-Type: multipart/mixed; boundary="===============0956035987371294590=="

--===============0956035987371294590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *at-spi2-core* to *2.38.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.36.1-2.38.0.patch
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

--===============0956035987371294590==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.36.1-2.38.0.patch"

From 29b132f8bbeeb571c1a0b55732ca1d9e856fd6c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:49:36 +0000
Subject: [PATCH] at-spi2-core: upgrade 2.36.1 -> 2.38.0

---
 .../atk/{at-spi2-core_2.36.1.bb => at-spi2-core_2.38.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.36.1.bb => at-spi2-core_2.38.0.bb} (89%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.36.1.bb b/meta/recipes-support/atk/at-spi2-core_2.38.0.bb
similarity index 89%
rename from meta/recipes-support/atk/at-spi2-core_2.36.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.38.0.bb
index 218af6afa7..88add83dd1 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.36.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.38.0.bb
@@ -7,8 +7,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d01e5326b4eb15ac3c27eed73ecf26f1"
-SRC_URI[sha256sum] = "97417b909dbbf000e7b21062a13b2f1fd52a336f5a53925bb26d27b65ace6c54"
+SRC_URI[sha256sum] = "84e36c3fe66862133f5fe229772b76aa2526e10de5014a3778f2fa46ce550da5"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.18.4


--===============0956035987371294590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-dbg: PKGSIZE changed from 674132 to 675684 (+0%)
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-dbg: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-dev: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-dev: PKGSIZE changed from 696343 to 698887 (+0%)
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-dev: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-doc: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-doc: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-an: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-an: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-as: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-as: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ast: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-be: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-be: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-bg: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-bn-in: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-bs: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ca+valencia: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ca: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-cs: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-da: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-da: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-de: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-de: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-el: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-el: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-en-ca: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-en-gb: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-eo: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-es: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-es: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-et: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-et: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-eu: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-fa: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-fi: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-fr: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-fur: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ga: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-gd: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-gl: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-gu: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-he: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-he: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-hi: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-hr: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-hu: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-id: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-id: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-it: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-it: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ja: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-kk: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-km: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-km: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-kn: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ko: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-lt: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-lv: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ml: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-mr: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ms: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-nb: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ne: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-nl: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-oc: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-or: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-or: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pa: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pl: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pt-br: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PKGSIZE changed from 736 to 666 (-10%)
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-pt: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ro: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ru: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sk: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sl: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sq: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sr+latin: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sr: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-sv: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ta: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-te: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-te: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-tg: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-tr: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-ug: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-uk: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-uz+cyrillic: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-vi: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-zh-cn: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-zh-hk: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-locale-zh-tw: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-src: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-src: PKGSIZE changed from 914033 to 919002 (+1%)
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-src: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-staticdev: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core-staticdev: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core: PKGSIZE changed from 404634 to 409030 (+1%)
packages/core2-32-poky-linux/at-spi2-core/at-spi2-core: PV changed from "2.36.1" to "2.38.0"
packages/core2-32-poky-linux/at-spi2-core: PKGV changed from 2.36.1 [default] to 2.38.0 [default]
packages/core2-32-poky-linux/at-spi2-core: PV changed from "2.36.1" to "2.38.0"

--===============0956035987371294590==--
