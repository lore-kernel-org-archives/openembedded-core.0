Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.4690.1621074783788318693
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7DDFF38C13C5
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.7 SUCCEEDED
Message-ID: <MADEUP.167F36ED79412A92.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151811
Content-Type: multipart/mixed; boundary="===============7964997130781047445=="

--===============7964997130781047445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.6p1-1.9.7.patch
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

--===============7964997130781047445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGSIZE changed from 71874 to 89615 (+25%)

--===============7964997130781047445==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.6p1-1.9.7.patch"

From c7c3539051e78a77afe1bb4cde79c34811559ba9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 06:12:28 +0000
Subject: [PATCH] sudo: upgrade 1.9.6p1 -> 1.9.7

---
 meta/recipes-extended/sudo/{sudo_1.9.6p1.bb => sudo_1.9.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.6p1.bb => sudo_1.9.7.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.6p1.bb b/meta/recipes-extended/sudo/sudo_1.9.7.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.6p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.7.bb
index b333459136..4685ca10b5 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.6p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.7.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "a9e9cdc058fafeb9cd3ebfb864c81755e524d98aa022152763f25bce8ca3ca90"
+SRC_URI[sha256sum] = "2bbe7c2d6699b84d950ef9a43f09d4d967b8bc244b73bc095c4202068ddbe549"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.27.0


--===============7964997130781047445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.6p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.7.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 3422944 to 3518916 (+3%)
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 2576439 to 2629036 (+2%)
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-lib: PKGSIZE changed from 831232 to 834152 (+0%)
packages/core2-32-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-lib: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGSIZE changed from 71874 to 89615 (+25%)
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGSIZE changed from 87493 to 89495 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGSIZE changed from 91660 to 93738 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGSIZE changed from 84426 to 86288 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGSIZE changed from 88869 to 90878 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGSIZE changed from 95504 to 97681 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGSIZE changed from 88673 to 90692 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGSIZE changed from 86900 to 88131 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGSIZE changed from 100045 to 102361 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGSIZE changed from 91725 to 93947 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGSIZE changed from 88658 to 90772 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGSIZE changed from 86471 to 88493 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGSIZE changed from 111683 to 113278 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGSIZE changed from 84153 to 86536 (+3%)
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGSIZE changed from 119857 to 122810 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGSIZE changed from 74263 to 76620 (+3%)
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGSIZE changed from 81502 to 83358 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 2389725 to 2490281 (+4%)
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGSIZE changed from 197356 to 197452 (+0%)
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PV changed from "1.9.6p1" to "1.9.7"
packages/core2-32-poky-linux/sudo/sudo: PKGSIZE changed from 1042532 to 1083940 (+4%)
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.6p1 [default] to 1.9.7 [default]
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.6p1" to "1.9.7"

--===============7964997130781047445==--
