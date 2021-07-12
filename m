Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5894.1626056248688731349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1323938C12CE
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:28 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdbm: upgrading to 1.20 SUCCEEDED
Message-ID: <MADEUP.1690E98B1BCF19E3.22557@lists.openembedded.org>
X-Groupsio-MsgNum: 153752
Content-Type: multipart/mixed; boundary="===============5511850872453186166=="

--===============5511850872453186166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdbm* to *1.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdbm-upgrade-1.19-1.20.patch
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

--===============5511850872453186166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)

--===============5511850872453186166==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-gdbm-upgrade-1.19-1.20.patch"

From 6024bedb7a39fe08af7d89690a88381352313401 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 12 Jul 2021 01:38:06 +0000
Subject: [PATCH] gdbm: upgrade 1.19 -> 1.20

---
 meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} (90%)

diff --git a/meta/recipes-support/gdbm/gdbm_1.19.bb b/meta/recipes-support/gdbm/gdbm_1.20.bb
similarity index 90%
rename from meta/recipes-support/gdbm/gdbm_1.19.bb
rename to meta/recipes-support/gdbm/gdbm_1.20.bb
index cd2617b130..51f9d17e49 100644
--- a/meta/recipes-support/gdbm/gdbm_1.19.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.20.bb
@@ -13,8 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "aeb29c6a90350a4c959cd1df38cd0a7e"
-SRC_URI[sha256sum] = "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
+SRC_URI[sha256sum] = "3aeac05648b3482a10a2da986b9f3a380a29ad650be80b9817a435fb8114a292"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.20.1


--===============5511850872453186166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gdbm/gdbm-bin: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-bin: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-compat: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-compat: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGSIZE changed from 801880 to 859532 (+7%)
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGSIZE changed from 14270 to 14680 (+3%)
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-doc: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGSIZE changed from 179576 to 187167 (+4%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGSIZE changed from 14387 to 14022 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGSIZE changed from 16763 to 18206 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGSIZE changed from 16039 to 17436 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGSIZE changed from 14847 to 14486 (-2%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGSIZE changed from 12299 to 11953 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGSIZE changed from 17153 to 18703 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGSIZE changed from 6164 to 5762 (-7%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGSIZE changed from 16737 to 18088 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGSIZE changed from 16594 to 18079 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGSIZE changed from 21254 to 22974 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGSIZE changed from 21057 to 22827 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGSIZE changed from 16096 to 17439 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGSIZE changed from 21800 to 23644 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGSIZE changed from 18101 to 17383 (-4%)
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGSIZE changed from 325415 to 325414 (-0%)
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-src: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGSIZE changed from 397009 to 419951 (+6%)
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)
packages/core2-32-poky-linux/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm: SRC_URI changed from "https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz file://run-ptest file://ptest.patch" to "https://ftp.gnu.org/gnu/gdbm/gdbm-1.20.tar.gz file://run-ptest file://ptest.patch"
packages/core2-32-poky-linux/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/perl/perl-dbg: PKGSIZE changed from 16787764 to 16789892 (+0%)
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 15028224 to 15029372 (+0%)

--===============5511850872453186166==--
