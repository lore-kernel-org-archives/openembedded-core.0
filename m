Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E6ECAC59C
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.89797.1756850188430836352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=s0MH+uQ9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=J+jUtrv/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101990c6e9095-3dbf4b15-45ed-461a-a95c-6963428a0ab6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850196;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MnM01+G71YjEvxGFu+zqXLmD6JaTvo3FhcfH37pBMaA=;
	b=s0MH+uQ956RjOOKWb5gV0+oHalB9CmOaC8KrSoyEMtyiB7/CLtQEZZ7LLiKUtswl
	sIXk0QJB325GM5sFLvg9cGU5BNQ7xJv9k2cv12w8T5CHbVkPYzenge0GUdCypPLOugu
	lqeMOjc88T55/r+iNLRe0LwPVEhmB3YisVNP6kxE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850196;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MnM01+G71YjEvxGFu+zqXLmD6JaTvo3FhcfH37pBMaA=;
	b=J+jUtrv/8B5Ju49icPjPekzu3LfQ63OOSfO/btbet+CM2yjHEWm8gBLflUgsbYhi
	afIg7FcXgFbN6uXhRcHDwqVPR6Auq/+Gckzyvx+/r3FXj5DPhmFeG5ayfva1OXJcIJR
	qiBabBUrSNyWgPNH4xvnRTyc77HPDHE8VMXTxKRE=
Content-Type: multipart/mixed; boundary="===============7199966149776902717=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.17p2 SUCCEEDED
Message-ID: <010101990c6e9095-3dbf4b15-45ed-461a-a95c-6963428a0ab6-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222801

--===============7199966149776902717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sudo* to *1.9.17p2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.17p1-1.9.17p2.patch
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

-- >8 --
From 6f4a409c48adc266c9b1c33150f470391949ce2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 19:33:56 +0000
Subject: [PATCH] sudo: upgrade 1.9.17p1 -> 1.9.17p2

---
 .../files/0001-sudo.conf.in-fix-conflict-with-multilib.patch    | 2 +-
 .../sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb}                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index 1989c5abd7..a5910d901e 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
+From 5163a5d1b41ab6a9e7a22df5318c5c2ec4dbde93 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.17p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 83bfc0621c..3a5c111961 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
+SRC_URI[sha256sum] = "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.47.1


--===============7199966149776902717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/sudo: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.17p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch" to "https://www.sudo.ws/dist/sudo-1.9.17p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch"
packages/x86-64-v3-poky-linux/sudo: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-dbg: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 6291544 to 6291488 (-0%)
packages/x86-64-v3-poky-linux/sudo/sudo-dev: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-doc: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-doc: PKGSIZE changed from 3285048 to 3290883 (+0%)
packages/x86-64-v3-poky-linux/sudo/sudo-lib: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-id: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-id: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sq: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sq: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-yue: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-yue: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-src: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-src: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo-sudo: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]
packages/x86-64-v3-poky-linux/sudo/sudo: PV changed from "1.9.17p1" to "1.9.17p2"
packages/x86-64-v3-poky-linux/sudo/sudo: PKGV changed from 1.9.17p1 [default] to 1.9.17p2 [default]

--===============7199966149776902717==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.17p1-1.9.17p2.patch"

RnJvbSA2ZjRhNDA5YzQ4YWRjMjY2YzliMWMzMzE1MGY0NzAzOTE5NDljZTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxOTozMzo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN1
ZG86IHVwZ3JhZGUgMS45LjE3cDEgLT4gMS45LjE3cDIKCi0tLQogLi4uL2ZpbGVzLzAwMDEtc3Vk
by5jb25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoICAgIHwgMiArLQogLi4u
L3N1ZG8ve3N1ZG9fMS45LjE3cDEuYmIgPT4gc3Vkb18xLjkuMTdwMi5iYn0gICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8ve3N1ZG9fMS45LjE3cDEuYmIg
PT4gc3Vkb18xLjkuMTdwMi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc3Vkby9maWxlcy8wMDAxLXN1ZG8uY29uZi5pbi1maXgtY29uZmxpY3Qtd2l0aC1tdWx0
aWxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5j
b25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCmluZGV4IDE5ODljNWFiZDcu
LmE1OTEwZDkwMWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVz
LzAwMDEtc3Vkby5jb25mLmluLWZpeC1jb25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL2ZpbGVzLzAwMDEtc3Vkby5jb25mLmluLWZpeC1j
b25mbGljdC13aXRoLW11bHRpbGliLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4YzY5MTky
NzU0YmE3M2RkNmUzMjczNzI4YTIxYWE3Mzk4OGY0YmZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA1MTYzYTVkMWI0MWFiNmE5ZTdhMjJkZjUzMThjNWMyZWM0ZGJkZTkzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBUdWUsIDE3IE5vdiAyMDIwIDExOjEzOjQwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHN1ZG8uY29uZi5pbjogZml4IGNvbmZsaWN0IHdpdGggbXVsdGlsaWIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE3cDEuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xN3AyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE3cDEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjE3cDIuYmIKaW5kZXggODNi
ZmMwNjIxYy4uM2E1YzExMTk2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1
ZG8vc3Vkb18xLjkuMTdwMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRv
XzEuOS4xN3AyLmJiCkBAIC03LDcgKzcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LnN1ZG8u
d3MvZGlzdC9zdWRvLSR7UFZ9LnRhci5neiBcCiAKIFBBTV9TUkNfVVJJID0gImZpbGU6Ly9zdWRv
LnBhbSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmNjA3ZWE3MTcwNzIxOTc3MzhhNzhmNzc4
NjkyY2Q2ZGY5YTdlM2U0MDQ1NjVmNTFkZTA2M2NhMjc0NTVkMzIiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNGEzOGExYWIzYWRiMTE5OTI1N2VkYzJhN2M0YTJiZDcxNDY2NWViNjA1YjA0MzY4ODQz
YjA2ZGFkYTJjZmNmYiIKIAogREVQRU5EUyArPSAiIHZpcnR1YWwvY3J5cHQgJHtAYmIudXRpbHMu
Y29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdwYW0nLCAnbGlicGFtJywgJycsIGQpfSIKIFJE
RVBFTkRTOiR7UE59ICs9ICIgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycs
ICdwYW0nLCAncGFtLXBsdWdpbi1saW1pdHMgcGFtLXBsdWdpbi1rZXlpbml0JywgJycsIGQpfSIK
LS0gCjIuNDcuMQoK

--===============7199966149776902717==--

