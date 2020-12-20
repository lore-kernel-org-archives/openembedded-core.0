Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.24166.1608473714406093511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 43E2838C14CF
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.4p1 SUCCEEDED
Message-ID: <MADEUP.165272529BE26768.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145960
Content-Type: multipart/mixed; boundary="===============8281043190558913289=="

--===============8281043190558913289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.4p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.3p1-1.9.4p1.patch
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

--===============8281043190558913289==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.3p1-1.9.4p1.patch"

From 1d24e325bc7d795e1fcab00524f232e86fb5a058 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 04:08:07 +0000
Subject: [PATCH] sudo: upgrade 1.9.3p1 -> 1.9.4p1

---
 meta/recipes-extended/sudo/{sudo_1.9.3p1.bb => sudo_1.9.4p1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.3p1.bb => sudo_1.9.4p1.bb} (95%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb b/meta/recipes-extended/sudo/sudo_1.9.4p1.bb
similarity index 95%
rename from meta/recipes-extended/sudo/sudo_1.9.3p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.4p1.bb
index ba61a7f247..040130b49a 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.4p1.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "dcb9de53e45e1c39042074b847f5e0d8ae1890725dd6a9d9101a81569e6eb49e"
+SRC_URI[sha256sum] = "1172099dfcdd2fa497e13a3c274a9f5920abd36ae7d2f7aaacd6bc6bc92fd677"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.20.1


--===============8281043190558913289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.3p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.4p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 3510432 to 3681976 (+5%)
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-dev: PKGSIZE changed from 11886 to 11939 (+0%)
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 633991 to 642027 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGSIZE changed from 85750 to 86538 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGSIZE changed from 89880 to 90665 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGSIZE changed from 82585 to 83324 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGSIZE changed from 93555 to 94269 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGSIZE changed from 84922 to 87612 (+3%)
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGSIZE changed from 84149 to 86140 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGSIZE changed from 97900 to 98664 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGSIZE changed from 86819 to 87568 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGSIZE changed from 87508 to 88240 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGSIZE changed from 84627 to 85400 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGSIZE changed from 117280 to 118241 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGSIZE changed from 70471 to 72487 (+3%)
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGSIZE changed from 79186 to 79919 (+1%)
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 2286782 to 2320229 (+1%)
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.3p1" to "1.9.4p1"
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.3p1 [default] to 1.9.4p1 [default]
packages/core2-32-poky-linux/sudo/sudo: PKGSIZE changed from 1946830 to 2062088 (+6%)

--===============8281043190558913289==--
