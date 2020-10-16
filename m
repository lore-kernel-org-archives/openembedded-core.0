Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12420.1602843683161759980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 07ECE38C162F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.3p1 SUCCEEDED
Message-ID: <MADEUP.163E71D6CF7A5586.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143456
Content-Type: multipart/mixed; boundary="===============7814734542207855306=="

--===============7814734542207855306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.3p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.3-1.9.3p1.patch
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

--===============7814734542207855306==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.3-1.9.3p1.patch"

From a018a172ceb9370743040bc02d883fc3d548c790 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 06:24:50 +0000
Subject: [PATCH] sudo: upgrade 1.9.3 -> 1.9.3p1

---
 meta/recipes-extended/sudo/{sudo_1.9.3.bb => sudo_1.9.3p1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.3.bb => sudo_1.9.3p1.bb} (95%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.3.bb b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
similarity index 95%
rename from meta/recipes-extended/sudo/sudo_1.9.3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.3p1.bb
index 270625ebe8..08a0fa03a3 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
@@ -6,7 +6,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "1d9889cc3b3b15ed8c2c7c3de3aa392a3a726838d020815067c080525c3f5837"
+SRC_URI[sha256sum] = "dcb9de53e45e1c39042074b847f5e0d8ae1890725dd6a9d9101a81569e6eb49e"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.18.4


--===============7814734542207855306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 3495360 to 3497232 (+0%)
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 633341 to 634034 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 2271422 to 2272073 (+0%)
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.3" to "1.9.3p1"
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.3 [default] to 1.9.3p1 [default]
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.3" to "1.9.3p1"

--===============7814734542207855306==--
