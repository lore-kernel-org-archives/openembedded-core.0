Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.358.1615826521390152517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 443FB38C1314
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.6 SUCCEEDED
Message-ID: <MADEUP.166C91A90B2CEA89.17966@lists.openembedded.org>
X-Groupsio-MsgNum: 149500
Content-Type: multipart/mixed; boundary="===============8535663494454930908=="

--===============8535663494454930908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.5p2-1.9.6.patch
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

--===============8535663494454930908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.5p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.6.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 3671396 to 3778920 (+3%)
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 647108 to 2575585 (+298%)
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-lib: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-lib: PKGSIZE changed from 827168 to 831232 (+0%)
packages/core2-32-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGSIZE changed from 86538 to 87493 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGSIZE changed from 90665 to 91660 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGSIZE changed from 83324 to 84426 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGSIZE changed from 77261 to 88869 (+15%)
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGSIZE changed from 94269 to 95504 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGSIZE changed from 87622 to 88673 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGSIZE changed from 98664 to 100045 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGSIZE changed from 90457 to 91725 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGSIZE changed from 87568 to 88658 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGSIZE changed from 88240 to 89316 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGSIZE changed from 85400 to 86471 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGSIZE changed from 34801 to 35312 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGSIZE changed from 118241 to 119857 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGSIZE changed from 72487 to 74263 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGSIZE changed from 79919 to 81502 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 2332613 to 2389706 (+2%)
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.5p2" to "1.9.6"
packages/core2-32-poky-linux/sudo/sudo: PKGSIZE changed from 1038428 to 1038436 (+0%)
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.5p2 [default] to 1.9.6 [default]

--===============8535663494454930908==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.5p2-1.9.6.patch"

From e7c2e402ff0fc5402f7b42764f71f494ec1aaace Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 07:18:04 +0000
Subject: [PATCH] sudo: upgrade 1.9.5p2 -> 1.9.6

---
 meta/recipes-extended/sudo/{sudo_1.9.5p2.bb => sudo_1.9.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.5p2.bb => sudo_1.9.6.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.5p2.bb b/meta/recipes-extended/sudo/sudo_1.9.6.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.5p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.6.bb
index ca23e94ace..2106e80ba1 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.5p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.6.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "539e2ef43c8a55026697fb0474ab6a925a11206b5aa58710cb42a0e1c81f0978"
+SRC_URI[sha256sum] = "62c9580492cd2e7dd6273b5cfe197560f2c508a83649d1ce4f61c8ee02ff3a55"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.17.1


--===============8535663494454930908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 647108 to 2575585 (+298%)
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGSIZE changed from 77261 to 88869 (+15%)

--===============8535663494454930908==--
