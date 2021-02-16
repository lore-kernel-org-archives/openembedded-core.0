Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.5212.1613463848681847767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id B718838C1285
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] subversion: upgrading to 1.14.1 SUCCEEDED
Message-ID: <MADEUP.16642CD2EC6D3851.16989@lists.openembedded.org>
X-Groupsio-MsgNum: 148122
Content-Type: multipart/mixed; boundary="===============1593416555241552989=="

--===============1593416555241552989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *subversion* to *1.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-subversion-upgrade-1.14.0-1.14.1.patch
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

--===============1593416555241552989==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-subversion-upgrade-1.14.0-1.14.1.patch"

From 58fd4213036c9b4bd6a70e9dd0b505154b9ad8c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 22:34:39 +0000
Subject: [PATCH] subversion: upgrade 1.14.0 -> 1.14.1

---
 .../subversion/{subversion_1.14.0.bb => subversion_1.14.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.0.bb => subversion_1.14.1.bb} (97%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.0.bb b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
similarity index 97%
rename from meta/recipes-devtools/subversion/subversion_1.14.0.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.1.bb
index 452a025fcc..f1d0038086 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "6ba8e218f9f97a83a799e58a3c6da1221d034b18d9d8cbbcb6ec52ab11722102"
+SRC_URI[sha256sum] = "2c5da93c255d2e5569fa91d92457fdb65396b0666fad4fd59b22e154d986e1a9"
 
 inherit autotools pkgconfig gettext python3native
 
-- 
2.17.1


--===============1593416555241552989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/subversion: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion: SRC_URI changed from "https://archive.apache.org/dist/subversion/subversion-1.14.0.tar.bz2 file://disable_macos.patch file://0001-Fix-libtool-name-in-configure.ac.patch file://serfmacro.patch" to "https://archive.apache.org/dist/subversion/subversion-1.14.1.tar.bz2 file://disable_macos.patch file://0001-Fix-libtool-name-in-configure.ac.patch file://serfmacro.patch"
packages/core2-32-poky-linux/subversion: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-dbg: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-dbg: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-dbg: PKGSIZE changed from 13141044 to 13142868 (+0%)
packages/core2-32-poky-linux/subversion/subversion-dev: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-dev: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-dev: PKGSIZE changed from 1809727 to 1810470 (+0%)
packages/core2-32-poky-linux/subversion/subversion-doc: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-doc: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-de: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-de: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-es: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-es: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-fr: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-fr: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-it: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-it: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-ja: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-ja: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-ko: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-ko: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-nb: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-nb: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-pl: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-pl: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-pt-br: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-pt-br: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-sv: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-sv: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-zh-cn: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-zh-cn: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-locale-zh-tw: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-locale-zh-tw: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-src: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-src: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion-src: PKGSIZE changed from 19939478 to 19950063 (+0%)
packages/core2-32-poky-linux/subversion/subversion-staticdev: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion-staticdev: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/subversion/subversion: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/subversion/subversion: PKGSIZE changed from 5493475 to 5497571 (+0%)

--===============1593416555241552989==--
