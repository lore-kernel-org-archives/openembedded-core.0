Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FDFCCA49F
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.39384.1656687063467456533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PJngeTmu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181ba3e6ebe-1fe67cb6-2e60-4d9b-aa66-27e3b3318a82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q7qG/8wE8mVOEqs6EBxp9SALn8Pp3BqRt+bamG9NL70=;
	b=PJngeTmufy3E9vrEP/e0nB9R3v2uOrWFzydZrWquM3wEbhUtBH82sLL7aAM7kyrO
	zygBW4pf22iQG4b1Oz51mqb/W9Ds+61sKADPfUl2xmY4/lccw0+4XkgV1M4wmbwhq5j
	rU0ak4vaC+9yWymnr297Cj9ndv5D8Ve6c67Vpd44=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q7qG/8wE8mVOEqs6EBxp9SALn8Pp3BqRt+bamG9NL70=;
	b=VcD1tJeT5DAk2UzAphbYiksILhHl5yGJPBKLzbu7UbQ+7PDv2W7K9TM6mvoLZjhp
	JiCgZ5E10jtxxfcaU+S/tl93rF25YcFzcmGZ/RV4wIruQKX2pCyNT7PzQDfkb1/MOAe
	obk6HcR3LBuF+p2zX0LB5uUk+V4KkEbQiSYVAZDo=
Content-Type: multipart/mixed; boundary="===============0928954821773201623=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.11p3 SUCCEEDED
Message-ID: 
 <01010181ba3e6ebe-1fe67cb6-2e60-4d9b-aa66-27e3b3318a82-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167498

--===============0928954821773201623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.11p3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.11p2-1.9.11p3.patch
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
--===============0928954821773201623==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.11p2-1.9.11p3.patch"

From 0288d12f7dccea0100c463ab3133b21eafe79e8a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 09:31:55 +0000
Subject: [PATCH] sudo: upgrade 1.9.11p2 -> 1.9.11p3

---
 .../sudo/{sudo_1.9.11p2.bb => sudo_1.9.11p3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.11p2.bb => sudo_1.9.11p3.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p2.bb b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.11p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.11p3.bb
index b3eae4a0fa..ba610ee2e7 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.11p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2"
+SRC_URI[sha256sum] = "4687e7d2f56721708f59cca2e1352c056cb23de526c22725615a42bb094f1f70"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.31.1


--===============0928954821773201623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.11p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch" to "https://www.sudo.ws/dist/sudo-1.9.11p3.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch"
packages/core2-32-poky-linux/sudo: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 4186952 to 4188496 (+0%)
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 2892189 to 2894085 (+0%)
packages/core2-32-poky-linux/sudo/sudo-lib: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 2840722 to 2841984 (+0%)
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.11p2" to "1.9.11p3"
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.11p2 [default] to 1.9.11p3 [default]

--===============0928954821773201623==--

